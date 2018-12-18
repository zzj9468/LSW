const express=require('express');
const async=require('async');
var router=express.Router();
var pool=require('../pool');
//测试地址：http://127.0.0.1:3000/index
router.get('/',(req,res)=>{
    var output={};
    var uname=req.query.uname;
    //console.log(uname);
    var sqls={
        miaosha:'SELECT * FROM lsw_index_miaosha',
        hot:'SELECT * FROM lsw_index_hot',
        f1_1:'SELECT * FROM lsw_index_product WHERE fid=1 LIMIT 0,8',
        f1_2:'SELECT * FROM lsw_index_product WHERE fid=1 LIMIT 8,8',
        f1_3:'SELECT * FROM lsw_index_product WHERE fid=1 LIMIT 16,8',
        f1_4:'SELECT * FROM lsw_index_product WHERE fid=1 LIMIT 24,8',
        f2_1:'SELECT * FROM lsw_index_product WHERE fid=2 LIMIT 0,8',
        f2_2:'SELECT * FROM lsw_index_product WHERE fid=2 LIMIT 8,8',
        f3_1:'SELECT * FROM lsw_index_product WHERE fid=3 LIMIT 0,8',
        f3_2:'SELECT * FROM lsw_index_product WHERE fid=3 LIMIT 8,8',
        f3_3:'SELECT * FROM lsw_index_product WHERE fid=3 LIMIT 16,8',
        f4_1:'SELECT * FROM lsw_index_product WHERE fid=4 LIMIT 0,8',
        f4_2:'SELECT * FROM lsw_index_product WHERE fid=4 LIMIT 8,8',
        f5_1:'SELECT * FROM lsw_index_product WHERE fid=5',
        cart:`SELECT * FROM lsw_cart WHERE uname='${uname}'`,
        carousel:'SELECT * FROM lsw_index_carousel'
    }

    async.forEachOf(sqls,function(value,key,callback){
        //遍历每条SQL语句并执行
        pool.query(value,(err,result)=>{
            if(err){
                callback(err);
            }else{
                output[key]=result;
                callback();
            }

        })
        
    },
    function(err){
        if(err) throw err;
        res.send(output);
    }
)

    // 1------查找秒杀
//     var sql='SELECT * FROM lsw_index_miaosha';
//     pool.query(sql,(err,result)=>{  //pool.query是异步的，不支持promise，只能使用回调函数
//         if(err)throw err;
//         //console.log(result);
//         output.miaosha=result;
//         // 2------查找热卖
//             var sql='SELECT * FROM lsw_index_hot';
//             pool.query(sql,(err,result)=>{
//             if(err)throw err;
//                 //console.log(result);
//             output.hot=result;
//     // 3-----查找1楼
//                 var sql='SELECT * FROM lsw_index_product WHERE fid=1 LIMIT 0,8';
//                 pool.query(sql,(err,result)=>{
//                     if(err)throw err;
//                     console.log(result);
//                     output.f1=result;
//                         // 3-----查找2楼
//                         var sql='SELECT * FROM lsw_index_product WHERE fid=2';
//                         pool.query(sql,(err,result)=>{
//                             if(err)throw err;
//                             //console.log(result);
//                             output.f2=result;
//                                // 3-----查找3楼
//                                 var sql='SELECT * FROM lsw_index_product WHERE fid=3';
//                                 pool.query(sql,(err,result)=>{
//                                     if(err)throw err;
//                                     //console.log(result);
//                                     output.f3=result;

//                                         // 3-----查找4楼
//                                         var sql='SELECT * FROM lsw_index_product WHERE fid=4';
//                                         pool.query(sql,(err,result)=>{
//                                             if(err)throw err;
//                                             //console.log(result);
//                                             output.f4=result;

//                                                 // 3-----查找5楼
//                                                 var sql='SELECT * FROM lsw_index_product WHERE fid=5';
//                                                 pool.query(sql,(err,result)=>{
//                                                     if(err)throw err;
//                                                     //console.log(result);
//                                                     output.f5=result; 
//                                                     // 3-----查找5楼
//                                                         var sql='SELECT * FROM lsw_cart';
//                                                         pool.query(sql,(err,result)=>{
//                                                             if(err)throw err;
//                                                             //console.log(result);
//                                                             output.cart=result; 
//                                                                 var sql='SELECT * FROM lsw_index_carousel';
//                                                                 pool.query(sql,(err,result)=>{
//                                                                     if(err)throw err;
//                                                                     //console.log(result);
//                                                                     output.carousel=result; 
                                                    

//                                                                         res.send(output);
//                                                                 });
//                                                         });
//                                                 });
//                                         });
//                                  });
//                         });
//                 });
//         });
// })

   

 })
module.exports=router;