const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.post('/email',(req,res)=>{
    var email=req.body.email;
   // console.log(email);
    var upwd=req.body.upwd;
        var sql='SELECT * FROM lsw_user WHERE email=? AND upwd=?';
        pool.query(sql,[email,upwd],(err,result)=>{
            if(err) throw err;
             console.log(result);
            if(result.length>0){
                res.send({code:1,msg:'登录成功',uid:result[0].uid});
            }else{
                res.send({code:0,msg:'登陆失败'});
            }
        });
    });
    
router.post('/uname',(req,res)=>{
    var uname=req.body.uname;
    var upwd=parseInt(req.body.upwd);
    //console.log(uname,upwd);
        var sql='SELECT * FROM lsw_user WHERE uname=? AND upwd=?';
        pool.query(sql,[uname,upwd],(err,result)=>{
            if(err) throw err;
           console.log(result);
            if(result.length>0){
                res.send({code:1,msg:'登录成功',uid:result[0].uid});
            }else{
                res.send({code:0,msg:'登陆失败'});
            }
        });

});
module.exports=router;