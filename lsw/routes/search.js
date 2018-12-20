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
        kwords.forEach((val,i,arr)=>{
            arr[i]=`%${val}%`;

        })       
         var arr=[];
        for(var f of kwords){   //不会改变原数组的值
            arr.push(` title like ? `)
        }


       //select *,(select prev_price from lsw_details where pid=lid) as p_price from lsw_index_product where title like '%葱%' and title like '%饼干%' or fid=(select fid from lsw_index_family where title like '%葱%' and title like '%饼干%')
       //select *,(select prev_price from lsw_details where pid=lid) as p_price from lsw_index_product where title like '%饼干糕点%' or fid=(select fid from lsw_index_family where title like '%饼干糕点%')

        var sql=`select *,(select prev_price from lsw_details where pid=lid) as p_price  from lsw_index_product where ${arr.join(' and ')}  or fid=(select fid from lsw_index_family where ${arr.join(' and ')} )`; 

        var k=kwords.concat(kwords);
        //console.log(k);
         pool.query(sql,k,(err,result)=>{
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
