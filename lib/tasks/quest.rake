namespace :quest do
  task stopitems: :environment do
    StopQuestItem.perform_later
  end
end