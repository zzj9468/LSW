const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.post('/',(req,res)=>{
    var uname_email=req.body.uname;
    var upwd=req.body.upwd;
    if(uname_email.indexOf('@',0)>0){
        var sql='SELECT * FROM lsw_user WHERE email? AND upwd=?';
        pool.query(sql,[uname_email,upwd],(err,result)=>{
            if(err) throw err;
             console.log(result);
            if(result.length>0){
                res.send({code:1,msg:'登录成功'});
            }else{
                res.send({code:0,msg:'登陆失败'});
            }
        });
    
    }else{
        var sql='SELECT * FROM lsw_user WHERE uname=? AND upwd=?';
        pool.query(sql,[uname_email,upwd],(err,result)=>{
            if(err) throw err;
            console.log(result);
            if(result.length>0){
                res.send({code:1,msg:'登录成功'});
            }else{
                res.send({code:0,msg:'登陆失败'});
            }
        });
}
});
module.exports=router;