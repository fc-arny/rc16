'use strict';

class Toggler {
  constructor(props) {
    this.toggler = props.toggler;
    this.onChange = props.onChange;

    this.active = this.getActivity();
    this.toggle = this.toggle.bind(this);

    this.addListener();
  }

  getActivity() {
    return $(`${this.toggler} input`).attr('checked') === 'checked';
  }

  setActivity() {
    this.active = this.getActivity();
  }

  addListener() {
    $(document).on('click', `${this.toggler} input`, this.toggle);
  }

  toggle() {
    this.active = !this.active;
    this.onChange(this.active);
  }
}

export default Toggler;
