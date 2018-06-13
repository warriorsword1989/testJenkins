node -v
npm -v
echo '安装依赖'
npm install
npm run build
echo '打包完成'
cd dist
zip -rq ./WebApp.zip ./*
cd ..
echo '文件压缩完毕le'