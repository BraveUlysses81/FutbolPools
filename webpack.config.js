var path = require('path');
var webpack = require('webpack');

module.exports = {
    entry : "./public/app.jsx",
    output : {
        path : __dirname,
        filename : "./public/bundle.js"
    },
    resolve : {
        extensions : ['.js', '.jsx']
    },
    module : {
        loaders : [
            {
                loader : 'babel-loader',
                query : {
                    presets : ['react', 'es2015', 'stage-2']
                },
                test : /\.jsx?$/,
                exclude : /(node_modules|bower_components)/
            }
        ]
    }
};