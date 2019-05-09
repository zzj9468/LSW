const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/',(req,res)=>{
    var lid=req.query.lid;
    var output={
        product:{},
        pics:[]
    };
    var sql='SELECT * FROM lsw_details WHERE lid=?';
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        output.product=result[0];

        var sql='SELECT * FROM lsw_detail_pic WHERE snacks_id=?';
        pool.query(sql,[lid],(err,result)=>{
        if(err) throw err; 
        output.pics=result;
        res.send(output);
 
        });
    });
})

module.exports=router;
