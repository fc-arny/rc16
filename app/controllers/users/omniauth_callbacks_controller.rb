class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: [:open_id]

  PROVIDER_ATTRIBUTES_TEMPLATE = {
    full_name:     lambda { |auth| auth.info.name },
    email:         lambda { |auth| auth.info.email },
    nickname:      lambda { |auth| auth.info.nickname },
    gender:        lambda { |auth| auth.extra.raw_info.gender },
    date_of_birth: lambda { |auth| ((Date.parse(auth.extra.raw_info.birthday) rescue nil)  if auth.extra.raw_info.birthday.present?) },
  }

  PROVIDERS = {
    facebook: PROVIDER_ATTRIBUTES_TEMPLATE.merge(
      date_of_birth: lambda { |auth| ((Date.strptime(auth.extra.raw_info.birthday, "%m/%d/%Y") rescue nil)  if auth.extra.raw_info.birthday.present?) },
      facebook_url:  lambda { |auth| auth.info.urls&.dig('Facebook') },
      website_url:   lambda { |auth| auth.info.urls&.dig('Website') },
    ),
    vkontakte: PROVIDER_ATTRIBUTES_TEMPLATE.merge(
      date_of_birth: lambda { |auth| ((Date.parse(auth.extra.raw_info.bdate) rescue nil)  if auth.extra.raw_info.bdate.present?) },
      gender:        lambda { |auth| {2 => 'male', 1 => 'female'}[auth.extra.raw_info.sex] },
      vkontakte_url: lambda { |auth| auth.info.urls['Vkontakte'] },
    ),
    github: PROVIDER_ATTRIBUTES_TEMPLATE.merge(
      github_url:   lambda { |auth| auth.extra.raw_info.html_url },
      website_url:  lambda { |auth| auth.extra.raw_info.blog },
      hireable:     lambda { |auth| auth.extra.raw_info.hireable },
    ),
  }

  # Create callback methods dynamically for each provider
  PROVIDERS.each do |provider, attrs_stub|
    define_method(provider) do
      auth = request.env['omniauth.auth']
      logger.debug auth.to_yaml
      attributes = Hash[attrs_stub.map { |k, v| [k, v.call(auth)] }]

      if user_signed_in? # Authenticated user connects to provider from profile page
        User.transaction do
          current_user.update("#{provider}_uid" => auth.uid)
          update_user_info(current_user, attributes)
        end
        redirect_to profile_users_path

      else # User tries to sign in with provider
        @user = User.where("#{provider}_uid" => auth.uid).first_or_initialize

        if @user.persisted? # Try to update user info if not filled
          update_user_info(@user, attributes)
        elsif User.where(email: attributes[:email]).any?
          @user = User.find_by(email: attributes[:email])
          @user.public_send("#{provider}_uid=", auth.uid)
          update_user_info(@user, attributes)
        else
          @user.update(
            attributes.merge(
              password: Devise.friendly_token[0, 20],
              confirmed_at: Time.now,
            )
          )
        end

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: I18n.t(provider, scope: 'application.user.signed_via')) if is_navigational_format?
        else
          session['devise.user_attributes'] = @user.attributes.merge('confirmed_at' => nil)
          redirect_to new_user_registration_url, alert: I18n.t('application.user.please_specify_email')
        end
      end
    end

  end

  # Try to update user info if not filled
  def update_user_info(user, attributes)
    attributes.each do |attr, value|
      if user.attributes[attr.to_s].blank? && value.present?
        user.send("#{attr}=", value)
      end
    end
    user.save if user.changed?
  end

end
