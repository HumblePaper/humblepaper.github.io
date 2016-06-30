var webpack = require('webpack');
var path = require('path');
// postcss plugins
// var cssimport = require('postcss-import');
// var customProperties = require('postcss-custom-properties');
// var autoprefixer = require('autoprefixer');
// var csswring = require('csswring');
// var cssnested = require('postcss-nested');

module.exports = {
  context: path.join(__dirname, "src"),
  entry: ["./actions/index.js", "./store/index.js", "./main.js"],
  output: {
    path: __dirname + '/static/',
    filename: 'app.js'
  },
  devtool: 'eval',
  debug: true,
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    }),
  ],
  module: {
    preLoaders: [
      { test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: { type: 'none' } }
    ],
    loaders: [
      { test: /\.js|\.tag$/, exclude: /node_modules/, include: /src/, loader: 'babel-loader', query: {
          presets: ['es2015'],
        }},
      // { test: /\.css$/, loader: 'style-loader!css-loader!postcss-loader' }
    ]
  },
  // postcss: [cssimport, cssnested, customProperties, autoprefixer, csswring],
  devServer: {
    contentBase: './static/',
    port: 8000,
    hot: true,
    inline: true
  }
};