$(function(){
    var lid=location.search.slice(5)   //?lid=3
    $.ajax({
        url:'http://localhost:3000/details',
        type:'get',
        data:'lid='+lid,
        dataType:'json'
    }).then(res=>{
        console.log(res);
        var {product,pics}=res;
        console.log(pics[0].sm);
        //console.log(product,pics);
        //console.log(product);
        
/********************面包屑*********************/
        var crumb=document.querySelector('.details .details_main .top .crumb p  span');
        var html_crumb=` >  ${product.zhonglei} > ${product.title}`;
        crumb.innerHTML=html_crumb;

    
/*********************上右--详情*********************/
        var h3=document.querySelector('.details .details_main .top .info h3');
        h3.innerHTML=product.title;
        var price=h3.nextElementSibling.children[0].children[0];
        price.innerHTML=`￥${product.price.toFixed(2)}`;
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
            
/*********************下左--详情*********************/
        var bt_table=document.querySelector('.bottom .bt_left .bt_info .bt_info_item1 .item1_top table');
        html='';
        html=`<tbody>
        <tr>
            <td width="36%">${product.title}</td>
             <td width="32%">品牌:${product.pingpai}</td>
            <td width="35%">产地:${product.chandi}</td>
        </tr>
        <tr>
            <td>毛重: ${product.guige}</td>
            <td>种类：${product.zhonglei}</td>
            <td>保质期：${product.dates}</td>
        </tr>
        </tbody>`;
        bt_table.innerHTML=html;
        var itm2=bt_table.parentNode.nextElementSibling.children[0];
        html=`<img src="${product.img}" alt="${product.title}">`;
        itm2.innerHTML=html;

        /********************上左-图片*********************/

        //小图
        html='';
        var sm=document.querySelector('.details .details_main .top .img .img_sm');
        for(var s of pics){
            html+=`<li><img src="${s.sm}" data-md='${s.md}' data-lg='${s.md}'></li>
            `;
        }
        sm.children[0].innerHTML=html;
        //中图
        var md=document.querySelector('.details .details_main .top .img .img_md img');
        var lg=document.querySelector('.details .details_main .top .img .img_lg');
        //设置中图和小图的默认图片路径为第一张图片的路径
        md.src=pics[0].md;
        lg.style.backgroundImage=`url("${pics[0].md}")`;
        sm.onmouseover=function(e){
            if(e.target.nodeName=='IMG'){
                var img=e.target;
                //根据遍历小图片时自定义属性中中图片和大图片的路径
                md.src=img.dataset.md;
                lg.style.backgroundImage=`url(${img.dataset.lg})`;

            }
        }
        /**********************放大镜效果************************ */
        var mask=document.querySelector('.details .details_main .top .img .img_md .move');
        var mask_l=document.querySelector('.details .details_main .top .img .img_md .move_limit');
        //鼠标移入移出时mask和大图片的显示和隐藏
        mask_l.onmouseover=function(){
           // console.log(mask);
            mask.className=mask.className.replace('hide','');
            //console.log(mask_l);
            //console.log(lg);
            lg.className=lg.className.replace('hide','');
        }
        mask_l.onmouseout=function(){
            mask.className+=' hide';
            lg.className+=' hide';
        }
        var msize=230;
        mask_l.onmousemove=function(e){
            var left=e.offsetX-msize/2;
            var top=e.offsetY-msize/2;
            //console.log(left,top);
            if(top<0){
                top=0;
            }
            if(left<0){
                left=0;
            }
            if(top>=230){
                top=230;
            }
            if(left>=230){
                left=230;
            }
            mask.style.left=`${left}px`;
            mask.style.top=`${top}px`;
            lg.style.backgroundPosition=`-${left*2}px -${top*2}px`
        }
        
        $('.details>.details_main>.top>.info>.btn>span>a').on('click',function(){
            var {title,price,guige,jifen}=product;
            var pic=pics[0].sm;
            var href=`details.html?lid=${lid}`;
            var count=$('.details>.details_main>.top>.info>.num>ul>li>input').val();
            if($(this).is('a')){
                $.ajax({
                    url:'http://127.0.0.1:3000/cart/addCart',
                    type:'post',
                    data:{lid,title,href,pic,price,count,jifen,guige},
                    dataType:'json',
                }).then(res=>{
                    //console.log(res);
                    if($(this).is($(this).parent().children(':first-child'))){
                        alert(res.msg);
                    }else{
                        location.href='cart.html';
                    }
                })
            }
        })
        //送至
        $('.details>.details_main>.top>.info>.store>.address>.add_top>span').on('click',function(){
            var span=$(this);
            //console.log(span);
            var dl=span.parent().next();
            if(dl.hasClass('hide')){
                $('.details>.details_main>.top>.info>.store>.address>dl').removeClass('hide');
                //console.log(dl.children(1).children());
                   dl.children(1).children().on('click',function(){
                        var a=$(this);
                            span.html(a.html());
                            console.log(span);
                            $('.details>.details_main>.top>.info>.store>.address>dl').addClass('hide');

                   })   
       
            }else{
                $('.details>.details_main>.top>.info>.store>.address>dl').addClass('hide');
            }
        })
        //数量
        $('.details>.details_main>.top>.info>.num>ul>li>a').on('click',function(){
            var a=$(this);
            console.log(a);
            var i=$('.details>.details_main>.top>.info>.num>ul>li:nth-child(2)>input').val();
            console.log(i)
            if(a.html()=='+')
                i++;
            else if(i>1)
                i--;
                $('.details>.details_main>.top>.info>.num>ul>li:nth-child(2)>input').val(i);
        })
        //下方零食详情、点评、配送、服务保障
        var as=$('.details> .bottom>.bt_left>.bt_info>.bt_list>ul>li>a');
        //console.log($('.details>.bottom>.bt_left>.bt_info>.item>.bt_info_item2').html());
        as.on('click',function(){ 
            var a=$(this);
            var i=a.parent().index();
            var item=$(`.details>.bottom>.bt_left>.bt_info>.item>.bt_info_item${i+1}`);
            if(item.hasClass('hide')){
               item.removeClass('hide').siblings().addClass('hide');
            }else{
                item.siblings().addClass('hide');
            }
        });
    })
})