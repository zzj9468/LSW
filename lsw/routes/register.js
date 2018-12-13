const express=require('express');
const router=express.Router();
const pool=require('../pool');

router.post("/click",(req,res)=>{
    var uname=req.body.uname;
    var phone=req.body.phone;
    var email=req.body.email;
    var upwd=req.body.upwd;
    console.log(upwd);
    var sql='INSERT INTO lsw_user(uname,phone,email,upwd) VALUES(?,?,?,?)';
    pool.query(sql,[uname,phone,email,upwd],(err,result)=>{
        if(err) throw err;
        console.log(result);
        if(result.affectedRows>0){
            res.send({code:1,msg:'注册成功'});
        }else{
           res.send({code:0,msg:'注册失败'});
        }
})
})
    router.post('/phone',(req,res)=>{
            //手机号
        var phone=req.body.phone; 
        var sql='SELECT * FROM lsw_user WHERE phone=?';
        pool.query(sql,phone,(err,result)=>{
            if(err) throw err;
            if(result.length>0){
               
                res.send({code:0,msg:'此手机号已被注册'});
            }else{
                 console.log(result);
               res.send({code:1});
            }
    })

})
    router.post('/uname',(req,res)=>{
         //用户名
    var uname=req.body.uname; 
    var sql='SELECT * FROM lsw_user WHERE uname=?';
    pool.query(sql,uname,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:0,msg:'此用户名已存在'});
        }else{
        res.send({code:1});
        }
    })
})

    router.post('/email',(req,res)=>{
        //邮箱
    var email=req.body.email; 
    var sql='SELECT * FROM lsw_user WHERE email=?';
    pool.query(sql,email,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:0,msg:'此邮箱已被注册'});
        }else{
            res.send({code:1});
        }
     })
})



         

module.exports=router;