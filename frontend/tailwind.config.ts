import type { Config } from 'tailwindcss';
import defaultTheme from 'tailwindcss/defaultTheme';

export default {
  darkMode: 'class',
  content: [
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        // Unilins Mediakit palette
        primary: '#0054A6',   // Unilins blue (main)
        secondary: '#00A7E1', // Unilins turquoise (accent)
        grayLight: '#F5F5F5',
        grayDark: '#2C2C2C',
      },
      fontFamily: {
        // Unilins corporate font (using system sans as fallback)
        sans: ['Helvetica Neue', 'Arial', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [],
} satisfies Config;
