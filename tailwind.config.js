module.exports = {
  theme: {
    extend: {
      flexGrow: {
        2: 2,
      },
      gridAutoColumns: {
        "min-left": "20% 80%",
      },
    },
  },
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
};
