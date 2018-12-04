const express=require('express');
const router=express.Router();
const pool=require('../pool');

router.post("/",(req,res)=>{
    var uname=req.body.uname;
    var phone=req.body.phone;
    var email=req.body.email;
    var upwd=req.body.upwd;
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
module.exports=router;