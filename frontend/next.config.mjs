import { NextResponse } from 'next/server';

/**
 * Next.js configuration for the PLN platform.
 * - Enables React Server Components (default with App Router).
 * - Exposes the backend API URL as an environment variable.
 * - Configures image domains if needed.
 */
export const config = {
  // Enable React strict mode (default in Next 14)
  reactStrictMode: true,
  // Enable swc minify for production builds
  swcMinify: true,
  // Public runtime config for the API URL (will be replaced at build time)
  env: {
    NEXT_PUBLIC_API_URL: process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080/api',
  },
  // Allow images from any domain (adjust later for production)
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
      },
    ],
  },
};
