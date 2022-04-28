module.exports = {
  devServer: {
      disableHostCheck: true,
      port: 8080,
      public: '0.0.0.0:8080'
  },
  publicPath: process.env.NODE_ENV === 'production'
    ? '/online-quiz-vueapp/' // Thay tên repository của các bạn vào đây nhé
    : '/'
}