//使用express构建web服务器
const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require("./routes/users");

var app=express();
app.listen(3000,()=>{
	console.log(`服务器创建成功`);
});
app.use(bodyParser.urlencoded({
    extended:false
}));

//将静态文件托管到public文件夹下
app.use(express.static('public'));

//使用路由器管理路由
app.use('/users',userRouter);