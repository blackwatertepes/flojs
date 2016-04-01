module.exports = {
  entry: "./src/workflow.js.coffee",
  output: {
    path: __dirname + '/../snorlax/webpack/projects',
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
