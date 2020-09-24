#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e
# 生成静态文件
call npm run build
# 进入生成的文件夹
cd docs/.vuepress/dist
# deploy to github
#echo 'b.miluluyo.github.io' > CNAME
if [ -z "$XAVIER" ]; then
  msg='deploy'
  githubUrl=git@github.com:xavi-bryant/vuepressBlog.git
else
  msg='来自 github actions的自动部署'
  githubUrl=https://xavi-bryant:${XAVIER}@github.com/xavi-bryant/vuepressBlog.git
  git config --global user.name "xavi-bryant"
  git config --global user.email "420948614@qq.com"
fi
git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github
#git push -f git@github.com:miluluyo/vdoingBlog.git master:gh-pages