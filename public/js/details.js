window.onload=function(){
    var lid=location.search.slice(5)   //?lid=3
    ajax({
        url:'http://localhost:3000/details',
        type:'get',
        data:'lid='+lid,
        dataType:'json'
    }).then(res=>{
        console.log(res);
        var {product,pics}=res;
        //console.log(product,pics);
        //console.log(product);
        //面包屑
        var crumb=document.querySelector('.details .details_main .top .crumb p  span');
        var html_crumb=` >  ${product.zhonglei} > ${product.title}`;
        crumb.innerHTML=html_crumb;
        //图片
        var img=document.querySelector('.details .details_main .top .img');
        var md=img.children[0];
        var html='';
        for(var p of pics){
            html+=`<img ${p.lid} src="img/details/md/f1_01_md1.jpg" alt="">`;
        }


        /*********************上右--详情*********************/
        var h3=document.querySelector('.details .details_main .top .info h3');
        h3.innerHTML=product.title;
        var price=h3.nextElementSibling.children[0].children[0];
        price.innerHTML=`￥${product.price}`;
        //节省
        price.nextElementSibling.children[1].innerHTML=`为您节省￥${(product.prev_price-product.yh_price).toFixed(2)}`;
        //市场价
        price.nextElementSibling.children[2].innerHTML=`(市场价￥${product.prev_price})`;
        //优惠价
        price.nextElementSibling.nextElementSibling.children[0].children[0].innerHTML=`买2件（含2件）以上,每件￥${product.yh_price}元`;
        //编号
        var bh=h3.nextElementSibling.nextElementSibling.children[0].children[0];
        bh.innerHTML=product.bianhao;
        //品牌
        var pinP=bh.parentNode.nextElementSibling.children[0];
        pinP.innerHTML=product.pingpai;
        //产地
        pinP.nextElementSibling.nextElementSibling.innerHTML=product.chandi;
        //口味
        pinP.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML=product.kouwei;
        //规格
        pinP.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML=product.guige;
        //积分
        bh.parentNode.nextElementSibling.nextElementSibling.children[0].innerHTML=`${product.jifen}分`;
 
    })
}