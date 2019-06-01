const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/list',(req,res)=>{
        var sql='SELECT * FROM lsw_user';
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            console.log(result)
            if(result.length>0){
                res.send({code:1,msg:'列表请求成功',data:result});
            }else{
                res.send({code:0,msg:'列表请求失败'});
            }
        });
    });
    
router.get('/user/:uid',(req,res)=>{
    var uid=req.params.uid;
    var sql='SELECT * FROM lsw_user where uid=?';
    pool.query(sql,uid,(err,result)=>{
        if(err)throw err;
        if(result.length>0){ //查询到一行数据
            res.send({code:200,msg:'customer exists',data:result[0]})
        }else{  //没有查询到数据
            res.send({code:400,msg:'no customer '});
        }
    })
})
router.put('/edit',(req,res)=>{
    var uname=req.body.uname;
    var upwd=parseInt(req.body.upwd);
    var email=req.body.email;
    var phone=req.body.phone;
    var uid=req.body.uid;
        var sql='UPDATE lsw_user SET uname=?,upwd=?,email=?,phone=? WHERE uid=?';
        pool.query(sql,[uname,upwd,email,phone,uid],(err,result)=>{
            if(err) throw err;
            if(result.changedRows>0){
                res.send({code:200,msg:'修改成功'})
            }else{
                res.send({code:401,msg:'修改失败'})
            }        
        });
});



router.post('/add',(req,res)=>{
    var data=req.body;
    var sql='INSERT INTO lsw_user(uname,upwd,email,phone) VALUES(?,?,?,?)';
    pool.query('select * from lsw_user where uname=?',data.uname,(err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.send({ code: 401, data: 'customer has exists' })
        }else{
            pool.query(sql,[data.uname,data.upwd,data.email,data.phone],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({ code: 200, data: '1 customer added' })
                }else{
                    res.send({ code: 400, msg: '0 cusotmer added' })
                }
            })
        }
    })
})

router.delete('/:uid',(req,res)=>{
    var uid=req.params.uid;
    pool.query('select * from lsw_user where uid=?',uid,(err, result) => {
        if (err) throw err;
        if (result.length == 0) {
            res.send({ code: 401, data: 'customer is not exists' })

        }else{
            var sql='DELETE FROM lsw_user WHERE uid=?';
            pool.query(sql,uid,(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({ code: 200, msg: "1 customer deleted" })
                }else{
                    res.send({ code: 400, msg: "0 customer deleted" })
                }
            })
        } 
    })      
})
module.exports=router;