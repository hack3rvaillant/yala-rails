const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    fontSize: {
      'xs': '.75rem',
      'sm': '.875rem',
      'tiny': '.875rem',
      'base': '1rem',
      'lg': '1.125rem',
      'xl': '1.25rem',
      '2xl': '1.5rem',
      '3xl': '1.875rem',
      '4xl': '2.25rem',
      '5xl': '3rem',
      '6xl': '4rem'
    },
    colors: {
      transparent: 'transparent',
      white: colors.white,
      black: colors.black,
      gray: colors.gray[500],
      brand: colors.amber[500],
      accent: colors.emerald[500],
      info: colors.cyan[500],
      warning: colors.orange[500],
      error: colors.fuchsia[500],
      success: colors.green[500],
      'gray-darker': colors.gray[900],
      'brand-darker': colors.amber[900],
      'accent-darker': colors.emerald[900],
      'info-darker': colors.cyan[900],
      'warning-darker': colors.orange[900],
      'error-darker': colors.fuchsia[900],
      'success-darker': colors.green[900],
      'gray-dark': colors.gray[700],
      'brand-dark': colors.amber[700],
      'accent-dark': colors.emerald[700],
      'info-dark': colors.cyan[700],
      'warning-dark': colors.orange[700],
      'error-dark': colors.fuchsia[700],
      'success-dark': colors.green[700],
      'gray-lite': colors.gray[400],
      'brand-lite': colors.amber[400],
      'accent-lite': colors.emerald[400],
      'info-lite': colors.cyan[400],
      'warning-lite': colors.orange[400],
      'error-lite': colors.fuchsia[400],
      'success-lite': colors.green[400],
      'gray-liter': colors.gray[200],
      'brand-liter': colors.amber[200],
      'accent-liter': colors.emerald[200],
      'info-liter': colors.cyan[200],
      'warning-liter': colors.orange[200],
      'error-liter': colors.fuchsia[200],
      'success-liter': colors.green[200],
      'warm-white': "#fbf9f6",
      'white-transparent': 'rgba($color: #FFFFFF, $alpha: 0.1)',
    },
    fontFamily: {
      sans: ['Poppins', ' sans-serif']
    }
  },
  variants: {
    extend: {
      opacity: ['disabled'],
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
  ],
}
