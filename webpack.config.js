const path = require("path");

module.exports = {
  mode: "production",
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "[name].js",
    path: path.resolve(__dirname, "public/packs"),
    publicPath: "/packs/"
  },
  resolve: {
    extensions: ['.js', '.jsx', '.json'],
    alias: {
      controllers: path.resolve(__dirname, 'app/controllers'),
    },
  }
};
