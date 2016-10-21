'use strict';

class TableTop {
  constructor(config) {
    this.selector = config.selector;
    this.interval = config.interval;
  }

  _addListener() {
    this.usersInterval = setInterval(() => {
      this.fetchUsers()
        .done(users => this.replaceUsers(users))
        .fail(err => console.error(err));
    }, this.interval);
  }

  start() {
    this.container = $(this.selector);

    this._addListener();
  }

  stop() {
    clearInterval(this.usersInterval);
  }

  fetchUsers() {
    return $.ajax({
      url: '/top'
    });
  }

  replaceUsers(users) {
    this.container.html(users);
  }
}

export default TableTop;
