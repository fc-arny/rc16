'use strict';

var webpack                        = require('webpack');
var path                           = require('path');
var app_path                       = path.join('app');
var NODE_ENV                       = process.env.NODE_ENV || 'development';

module.exports = {
  context : path.resolve('./'),

  entry: {
    'vendor-bundle': './app'
  },

  output: {
    path: '../app/assets/javascripts/bundle',
    filename: '[name].chunk.js',
    publicPath: '../app/assets/javascripts'
  },

  resolve : {
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
    }]
  },

  devtool: NODE_ENV === 'development' ? 'cheap-source-map' : null
};
