const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/',(req,res)=>{
    var sql='SELECT * FROM lsw_cart';
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
        //console.log(result);
    });
})
router.post('/addCart',(req,res)=>{
    var lid=req.body.lid;
    var title=req.body.title;
    var href=req.body.href;
    var pic=req.body.pic;
    var price=req.body.price;
    var count=req.body.count;
    var jifen=req.body.jifen;
    var guige=req.body.guige;
    console.log(lid);
    console.log(count);
    var sql='SELECT * FROM lsw_cart WHERE lid=?';
    pool.query(sql,lid,(err,result)=>{
        if(err) throw err;
        console.log(result);
        if(result.length==0){
            var sql='INSERT INTO lsw_cart(lid,title,href,pic,price,count,jifen,guige) VALUES(?,?,?,?,?,?,?,?)';
            pool.query(sql,[lid,title,href,pic,price,count,jifen,guige],(err,result)=>{
                if(err) throw err;
                //console.log(result);
                if(result.affectedRows>0){
                    res.send({code:1,msg:'添加购物车成功'});
                }else{
                    res.send({code:0,msg:"商品添加失败"});
                }
            });
        }else{
            var sql='SELECT count FROM lsw_cart WHERE lid=?';
            pool.query(sql,lid,(err,result)=>{
                if(err) throw err;
                console.log(result);
                var c=Number(result[0].count);
                
                console.log(c);
                
                console.log(c+count);
                var sql='UPDATE lsw_cart SET count=? WHERE lid=?';
                pool.query(sql,[c+count,lid],(err,result)=>{
                    if(err) throw err;
                    console.log(result);
                    if(result.affectedRows>0){
                        res.send({code:1,msg:'添加购物车成功'});
                    }else{
                        res.send({code:0,msg:"商品添加失败"});
                    }

            })
            });

    }


    })
});

module.exports=router;