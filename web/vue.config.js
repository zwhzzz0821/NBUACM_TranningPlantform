module.exports = {
    publicPath: '/',
    devServer: {
        host: '0.0.0.0',
        port: 8080,
        proxy: {
            '/api': {
                target: 'http://localhost:9003/', //接口域名
                changeOrigin: true,             //是否跨域
                ws: true,                       //是否代理 websockets
                secure: true,                   //是否https接口
                pathRewrite: {                  //路径重置
                    '^/api': ''
                }
            }
        }
    },
    chainWebpack: config => { config.externals({ './cptable': 'var cptable' }) }
}
// module.exports = { chainWebpack: config => { config.externals({ './cptable': 'var cptable' }) }}