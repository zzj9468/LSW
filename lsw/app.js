//使用express构建web服务器
const express=require('express');
const cors=require('cors');
const session=require('express-session');
const bodyParser=require('body-parser');
const register=require("./routes/register.js");
const login=require('./routes/login.js');
const index=require('./routes/index.js');
const details=require('./routes/details');
const cart=require('./routes/cart');
const search=require('./routes/search');
const customer=require('./routes/customer');
const product=require('./routes/product');
const admin=require('./routes/admin')


var app=express();
app.listen(3000,()=>{
	console.log(`服务器创建成功`);
});
app.use(bodyParser.urlencoded({
    extended:false
}));

app.use(bodyParser.json())

//将静态文件托管到public文件夹下
app.use(express.static('public'));
//跨域的URL
app.use(cors({
	origin: ["http://127.0.0.1:5500", 'http://127.0.0.1:8091'],
	credentials:true
}))
app.use(session({
	secret:"128位随机字符",
  	resave:false,
  	saveUninitialized:true
}))



//使用路由器管理路由
app.use('/register',register);
app.use('/login',login);
app.use('/index',index);
app.use('/details',details);
app.use('/cart',cart);
app.use('/search',search);
app.use('/customer',customer);
app.use('/product',product);
app.use('/admin',admin)