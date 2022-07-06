echo ******Start server script*******
npm install
if [ $DEV ];then npm run dev;else npm start;fi