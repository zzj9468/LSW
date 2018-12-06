const express=require('express');
var router=express.Router();
var pool=require('../pool');
//测试地址：http://127.0.0.1:3000/index
router.get('/',(req,res)=>{
    var output={
        miaosha:[/*秒杀商品*/],
        hot:[/*热卖商品*/],
        f1:[/*1楼商品*/],
        f2:[/*2楼商品*/],
        f3:[/*3楼商品*/],
        f4:[/*4楼商品*/],
        f5:[/*5楼商品*/],
        cart:[],
        carousel:[]
    };
    // 1------查找秒杀
    var sql='SELECT * FROM lsw_index_miaosha';
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        //console.log(result);
        output.miaosha=result;
    // 2------查找热卖
        var sql='SELECT * FROM lsw_index_hot';
        pool.query(sql,(err,result)=>{
          if(err)throw err;
            //console.log(result);
          output.hot=result;
    // 3-----查找1楼
        var sql='SELECT * FROM lsw_index_product WHERE fid=1';
        pool.query(sql,(err,result)=>{
            if(err)throw err;
            //console.log(result);
            output.f1=result;
      // 3-----查找2楼
            var sql='SELECT * FROM lsw_index_product WHERE fid=2';
            pool.query(sql,(err,result)=>{
                if(err)throw err;
                //console.log(result);
                output.f2=result;
      // 3-----查找3楼
        var sql='SELECT * FROM lsw_index_product WHERE fid=3';
        pool.query(sql,(err,result)=>{
            if(err)throw err;
            //console.log(result);
            output.f3=result;

       // 3-----查找4楼
       var sql='SELECT * FROM lsw_index_product WHERE fid=4';
       pool.query(sql,(err,result)=>{
           if(err)throw err;
           //console.log(result);
           output.f4=result;

        // 3-----查找5楼
        var sql='SELECT * FROM lsw_index_product WHERE fid=5';
        pool.query(sql,(err,result)=>{
            if(err)throw err;
            //console.log(result);
            output.f5=result; 
        // 3-----查找5楼
            var sql='SELECT * FROM lsw_cart';
            pool.query(sql,(err,result)=>{
                if(err)throw err;
                //console.log(result);
                output.cart=result; 
                var sql='SELECT * FROM lsw_index_carousel';
                pool.query(sql,(err,result)=>{
                    if(err)throw err;
                    //console.log(result);
                    output.carousel=result; 
    

        res.send(output);
             });
            });
             });
            });
         });
        });
        });
    });
})

    // 查找热卖

})
module.exports=router;