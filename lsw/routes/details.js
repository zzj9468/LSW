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

router.get('/list/:pageSize/:curPage',(req,res)=>{
    var pageSize= parseInt(req.params.pageSize);
    var curPage= parseInt(req.params.curPage);
    console.log((curPage-1)*pageSize,(curPage-1)*pageSize+pageSize)
    var sql=`SELECT * FROM lsw_index_product order by pid ASC`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            var newResult=result.slice((curPage-1)*pageSize,(curPage-1)*pageSize+pageSize)
            res.send({code:1,msg:'列表请求成功',data:newResult});
        }else{
            res.send({code:0,msg:'列表请求失败'});
        }
    });
});

router.get('/list',(req,res)=>{
    var sql=`SELECT * FROM lsw_index_product`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:'列表请求成功',data:result});
        }else{
            res.send({code:0,msg:'列表请求失败'});
        }
    });
});

module.exports=router;
