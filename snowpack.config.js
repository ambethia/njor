module.exports = {
  mount: {
    public: '/',
    src: '/_dist_',
  },
  plugins: ['@snowpack/plugin-svelte'],
  proxy: {
    '/api': 'http://0.0.0.0:3000/api',
  },
}
