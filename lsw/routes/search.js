const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/',(req,res)=>{
    var kwords=decodeURIComponent(
        req.query.kwords
    );
    //console.log(kwords);
    var output={
        pno:0,   //第几页商品
        pageSize:8,   //每页的数量
        count:0,   //查询的所有数据的和
        pageCount:0,   //总共有几页  --ceil(count/pageSize)
        product:[]  ///所有商品，starti开始，endi结束
    }
    if(req.query.pno!==undefined)
        output.pno=parseInt(req.query.pno);
        kwords=kwords.split(' ');
        var arr=[];
        for(var f of kwords){   //不会改变原数组的值
            arr.push(` title like ? `)
        }
        kwords.forEach((val,i,arr)=>{
            arr[i]=`%${val}%`;
        })
       // console.log(kwords);
         var where=" where "+arr.join(' and ');
         var sql="select *,(select prev_price from lsw_details where pid=lid) as p_price  from lsw_index_product "+where;
         //console.log(sql);
         pool.query(sql,kwords,(err,result)=>{
             if(err) throw err;
             var count =result.length;
             var pageCount=Math.ceil(count/output.pageSize);
             output.count=count;
             output.pageCount=pageCount;
             var starti=output.pno*output.pageSize;
             //console.log(starti);
             output.products=result.slice(starti,starti+output.pageSize);
             res.send(output);
         });
})
module.exports=router;
