module.exports = {
  entry: "./src/chart.js.coffee",
  output: {
    path: __dirname + '/../flo_rails/vendor/assets/javascripts',
    filename: "flo.js"
  },
  resolve: {
    extensions: ['', '.js', '.coffee', '.js.coffee']
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' }
    ]
  }
}
