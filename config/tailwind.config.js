const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        bluew: '#3678C2',
        grayw: '#434C55',
        greenw: '#60B524',
      },
      fontFamily: {
        sans: ['Proxima Nova Bold', 'Proxima Nova Light', 'Inter var', ...defaultTheme.fontFamily.sans],
        'nova_bold': ['Proxima Nova Bold', ...defaultTheme.fontFamily.sans],
        'nova_light': ['Proxima Nova Light', ...defaultTheme.fontFamily.sans],
      },
    }, 
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('flowbite/plugin'),
  ]
}
