import json from 'rollup-plugin-json';
import babel from 'rollup-plugin-babel';
import riot from 'rollup-plugin-riot';
import npm from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';

export default {
entry: 'src/index.js',
dest: 'static/app.js',
format: 'umd',
// sourceMap: true,
plugins: [
    json(),
    riot(),
    npm({
        jsnext: true,
        main: true,
        browser: true
    }),
    commonjs(),
    babel({
    	exclude: 'node_modules/**',
    	externalHelpers: true
    	// babelrc: false
    })
]}