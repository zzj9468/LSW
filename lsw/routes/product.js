const express=require('express');
var router=express.Router();
const pool=require('../pool');

router.get('/',(req,res)=>{
        var sql='SELECT * FROM lsw_index_product';
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            console.log(result)
            if(result.length>0){
                res.send({code:1,msg:'列表请求成功',result});
            }else{
                res.send({code:0,msg:'列表请求失败'});
            }
        });
    });

router.get('/detail/:pid',(req,res)=>{
    var pid=req.params.pid;
    console.log(pid)
    var sql='SELECT * FROM lsw_index_product where pid=?';
    pool.query(sql,pid,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:'列表请求成功',data:result[0]});
        }else{
            res.send({code:0,msg:'列表请求失败'});
        }
    });
});
router.put('/edit',(req,res)=>{
    var fid=req.body.fid;
    var title=req.body.title;
    var subtitle=req.body.subtitle;
    var prices=req.body.prices;
    var hrefs=req.body.hrefs;
    var pid=req.body.pid;
        var sql='UPDATE lsw_index_product SET fid=?,title=?,subtitle=?,prices=?,hrefs=? WHERE pid=?';
        pool.query(sql,[fid,title,subtitle,prices,hrefs,pid],(err,result)=>{
            if(err) throw err;
            if(result.changedRows>0){
                res.send({code:200,msg:'修改成功'})
            }else{
                res.send({code:401,msg:'修改失败'})
            }        
        });

});

/*POST /admin/dish/image
*请求参数：
*接收客户端上传的菜品图片，保存在服务器上，返回该图片在服务器上的随机文件名
*返回数据：
*   {code:200, msg:"upload succ", fileName:'13512873612-2342.jpg'}
*/
//引入multer中间件
const multer = require('multer');
const fs = require('fs');
var upload = multer({
  dest: 'tmp/' //指定客户端上传的文件临时存储路径
})
//定义路由，使用文件上传中间件
router.post('/image', upload.single('dishImg'), (req, res)=>{
  //console.log(req.file); //客户端上传的文件
  //console.log(req.body); //客户端随同图片提交的字符数据
  //把客户端上传的文件从临时目录转移到永久的图片路径下
  var tmpFile = req.file.path;  //临时文件名
  var suffix = req.file.originalname.substring( req.file.originalname.lastIndexOf('.') ); //原始文件名中的后缀部分
  var newFile = randFileName(suffix); //目标文件名
  fs.rename(tmpFile, 'img/dish/'+newFile, ()=>{
    res.send({code:200, msg:'upload succ', fileName: newFile}) //把临时文件转移
  })
})

//生成一个随机文件名
//参数：suffix表示要生成的文件名中的后缀
//形如： 1351324631-8821.jpg
function randFileName(suffix){
  var time = new Date().getTime(); //当前系统时间戳
  var num = Math.floor(Math.random()*(10000-1000) + 1000);  //4位的随机数字
  return  time + '-' + num + suffix;
}


router.post('/add',(req,res)=>{
    var fid=req.body.fid;
    var title=req.body.title;
    var subtitle=req.body.subtitle;
    var prices=req.body.prices;
    console.log(prices)
    var imgs=req.body.imgUrl;
    var sql='SELECT * FROM lsw_index_product';
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            var hrefs=`details.html?lid=${result.length+1}`;
            var sql='INSERT INTO lsw_index_product(fid,title,subtitle,prices,hrefs,imgs) VALUES(?,?,?,?,?,?)';
            pool.query(sql,[fid,title,subtitle,prices,hrefs,imgs],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:200,msg:'product添加成功',dishId:result.insertId})//insert语句产生的自增编号输出给客户端
                }else{
                    res.send({code:400,msg:'product添加失败'})
                }
            })        
        }else{
            res.send({code:0,msg:'列表请求失败'});
        }
    })
})

router.delete('/:pid',(req,res)=>{
    var pid=req.params.pid;
    var sql='DELETE FROM lsw_index_product WHERE pid=?';
    pool.query(sql,pid,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200,msg:'删除成功'})
        }else{
            rse.send({code:400,msg:'删除失败'})
        }
    })
})
module.exports=router;