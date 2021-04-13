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
      brand: "#5710b2",
      accent: "#ffc701",
      info: "#00a3ff",
      warning: "#ffc701",
      error: "#f1416d",
      success: "#20d489",
      'brand-lite': "#dabdff",
      'accent-lite': "#fff8dd",
      'info-lite': "#e7f6ff",
      'warning-lite': "#fff8dd",
      'error-lite': "#ffeff3",
      'success-lite': "#ccfce9",
      'warm-white': "#fbf9f6",
      gray: "#a3a6b9",
      'gray-lite': "#CCCCCC",
      'gray-dark': "#7e8299",
      white: "#FFFFFF",
      black: "#222222",
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
