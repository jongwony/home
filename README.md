# home

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

# deploy

### Compiles and minifies for production

```
npm run build
cd dist
git init
echo home.jongwony.com > CNAME
git add -A
git commit -m 'deploy'
git push -f https://github.com/jongwony/home master:gh-pages
```