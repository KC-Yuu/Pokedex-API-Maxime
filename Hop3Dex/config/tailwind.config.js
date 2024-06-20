const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'red-500': '#f56565',
        'blue-500': '#4299e1',
        'green-500': '#48bb78',
        'yellow-500': '#ecc94b',
        'purple-500': '#9f7aea',
        'blue-300': '#63b3ed',
        'indigo-700': '#4c51bf',
        'gray-800': '#2d3748',
        'pink-400': '#ed64a6',
        'gray-200': '#e2e8f0',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
