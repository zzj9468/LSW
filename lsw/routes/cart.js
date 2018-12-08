const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/',(req,res)=>{
    var sql='SELECT * FROM lsw_cart';
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
        console.log(result);
    });
})

module.exports=router;