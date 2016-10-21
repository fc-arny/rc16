'use strict';

class Video {
  constructor(config) {
    this.selector  = config.selector;
    this.videos    = config.videos

    this.nextVideo = this.nextVideo.bind(this);

    /**
     * NOTE: Video.start() запускается по событию turbolinks:load
     */
  }

  start() {
    this.index     = 0;
    this.container = $(this.selector);
    this.setVideo();

    this._addListener();
  }

  _addListener() {
    this.container.on('ended', this.nextVideo);
  }

  _removeListener() {
    this.container.off('ended', this.nextVideo);
  }

  stop() {
    this._removeListener();
  }

  nextVideo() {
    this.index += 1;

    if (this.index > this.videos.length - 1) {
      this.index = 0;
    }

    this.setVideo();
  }

  setVideo() {
    this.container.attr('src', this.videos[this.index]);
  }
}

export default Video;
