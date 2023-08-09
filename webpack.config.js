const path = require("path");

module.exports = {
  mode: "development",
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "[name].js",
    path: path.resolve(__dirname, "public/packs"),
    publicPath: "/packs/"
  }
};
