npm run build
cd dist
git init
echo home.jongwony.com > CNAME
git add -A
git commit -m 'deploy'
git push -f https://github.com/jongwony/home main:gh-pages
