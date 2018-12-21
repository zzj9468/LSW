const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/',(req,res)=>{
    var uid=req.query.uid;
    var sql='SELECT * FROM lsw_cart WHERE uid=?';
    pool.query(sql,uid,(err,result)=>{
        if(err) throw err;
        res.send(result);
        //console.log(result);
    });
})
router.post('/addCart',(req,res)=>{
    var lid=req.body.lid;
    var uid=req.body.uid;
    var uname=req.body.uname;
    //console.log(uid);
    //console.log(uname);
    var title=req.body.title;
    var href=req.body.href;
    var pic=req.body.pic;
    var price=req.body.price;
    var count=req.body.count;
    var jifen=req.body.jifen;
    var guige=req.body.guige;
    //console.log(lid);
   // console.log(count);
    var sql='SELECT * FROM lsw_cart WHERE lid=? AND uid=?';
    pool.query(sql,[lid,uid],(err,result)=>{
        if(err) throw err;
        //console.log(result);
        if(result.length==0){
            var sql='INSERT INTO lsw_cart(lid,uid,uname,title,href,pic,price,count,jifen,guige) VALUES(?,?,?,?,?,?,?,?,?,?)';
            pool.query(sql,[lid,uid,uname,title,href,pic,price,count,jifen,guige],(err,result)=>{
                if(err) throw err;
                //console.log(result);
                if(result.affectedRows>0){
                    res.send({code:1,msg:'添加购物车成功'});
                }else{
                    res.send({code:0,msg:"商品添加失败"});
                }
            });
        }else{
            var sql='SELECT count FROM lsw_cart WHERE lid=? AND uid=?';
            pool.query(sql,[lid,uid],(err,result)=>{
                if(err) throw err;
                console.log(result);
                var c=parseInt(result[0].count);
                console.log(result[0].count);
                console.log(c);
                count=parseInt(count);
                console.log(c+count);
                var sql='UPDATE lsw_cart SET count=? WHERE lid=? AND uid=?';
                pool.query(sql,[c+count,lid,uid],(err,result)=>{
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



router.post('/upCart',(req,res)=>{
    var lid=req.body.lid;
    var uid=req.body.uid;
    var count=req.body.count;
    //console.log(lid);
   // console.log(count);

    var sql='UPDATE lsw_cart SET count=? WHERE lid=? AND uid=?';
    pool.query(sql,[count,lid,uid],(err,result)=>{
        if(err) throw err;
        console.log(result);
        if(result.affectedRows>0){
            res.send({code:1,msg:'添加购物车成功'});
        }else{
            res.send({code:0,msg:"商品添加失败"});
        }

    })


});

module.exports=router;