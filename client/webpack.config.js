'use strict';

var webpack                        = require('webpack');
var path                           = require('path');
var app_path                       = path.join('app');
var NODE_ENV                       = process.env.NODE_ENV || 'development';

module.exports = {
  context : __dirname,

  entry: {
    vendor: [
      'jquery',
      'jquery-ujs',
      './app'
    ]
  },

  output: {
    path: '../app/assets/javascripts/bundle',
    filename: 'vendor-bundle.chunk.js'
  },

  resolve : {
    root: [path.join(__dirname, 'app')],
    extensions: ['', '.js'],
    alias : {
      components : path.resolve(app_path + '/components'),
      objects    : path.resolve(app_path + '/objects'),
      utils      : path.resolve(app_path + '/utils')
    }
  },

  module: {
    loaders: [{
      loader: 'babel',
      test: path.resolve(app_path),
      include: path.resolve(app_path)
    }, {
      test: require.resolve('jquery'), loader: 'expose?jQuery'
    }, {
      test: require.resolve('jquery'), loader: 'expose?$'
    }, {
      test: require.resolve('jquery-ujs'), loader: 'imports?jQuery=jquery'
    }]
  },

  devtool: NODE_ENV === 'development' ? 'cheap-source-map' : null
};
