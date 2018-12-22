$(function(){
    var lid=location.search.slice(5)   //?lid=3
    var uname=sessionStorage.getItem('uname');
    var uid=sessionStorage.getItem('uid');
    $.ajax({
        url:'http://localhost:3000/details',
        type:'get',
        data:'lid='+lid,
        dataType:'json'
    }).then(res=>{
        console.log(res);
        var {product,pics}=res;        
/********************面包屑*********************/
        var crumb=$('.details .details_main .top .crumb p  span');
        var html_crumb=` >  ${product.zhonglei} > ${product.title}`;
        crumb.html(html_crumb);

    
/*********************上右--详情*********************/
        var h3=$('.details>.details_main>.top>.info>h3');
        // 价格
        h3.html(product.title)
        .next('div.price').children('ul').children(':first-child').html(`￥${product.price.toFixed(2)}`)
        .next().children(':nth-child(2)').html(`为您节省￥${(product.prev_price-product.yh_price).toFixed(2)}`)
        .next().html(`(市场价￥${product.prev_price})`).parent().next().children().children(':first-child').html(`买2件（含2件）以上,每件￥${product.yh_price}元`);
        //编号
        var bh=h3.next().next().children(':first-child').children('span').html(product.bianhao)
        .parent().next().children('span:first-child').html(product.pingpai)
        .next().next().html(product.chandi)
        .next().next().html(product.kouwei)
        .next().next().html(product.guige)
        .parent().next().children('span').html(`${product.jifen}分`);
            
/*********************下左--详情*********************/
        var bt_table=$('.bottom>.bt_left>.bt_info>.item>.bt_info_item1>.item1_top>table');
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
        bt_table.html(html);
        var itm2=bt_table.parent().next().children('p');
        html=`<img src="${product.img}" alt="${product.title}">`;
        itm2.html(html);

        /********************上左-图片*********************/

        //小图
        html='';
        var sm=$('.details>.details_main>.top>.img>.img_sm');
        for(var s of pics){
            html+=`<li><img src="${s.sm}" data-md='${s.md}' data-lg='${s.md}'></li>
            `;
        }
        sm.children('ul').html(html);
        //中图
        var md=sm.prev().prev().children('img');
        var lg=sm.prev();
        console.log(pics[0].md);
        //设置中图和小图的默认图片路径为第一张图片的路径
        md.attr('src',pics[0].md);
        lg.css('backgroundImage',`url("${pics[0].md}")`);
        sm.children('ul').children('li').children('img').on('mouseover',function(){
                var img=$(this);
                //根据遍历小图片时自定义属性中中图片和大图片的路径
                md.attr('src',img.data('md'));
                lg.css('backgroundImage',`url(${img.data('md')})`);

        })
        /**********************放大镜效果************************ */ 
        var msize=230;
        var mask=$('.details>.details_main>.top>.img>.img_md>.move');
        var mask_l=$('.details>.details_main>.top>.img>.img_md>.move_limit');
        //鼠标移入移出时mask和大图片的显示和隐藏
        mask_l.on('mouseover',function(){
           // console.log(mask);
            mask.removeClass('hide');
            lg.removeClass('hide');
        })
        .on('mouseout',function(){
            mask.addClass(' hide');
            lg.addClass(' hide');
        })

        mask_l.on('mousemove',function(e){
            var left=e.offsetX-msize/2;
            var top=e.offsetY-msize/2;
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
            mask.css('left',`${left}px`);
            mask.css('top',`${top}px`);
            lg.css('backgroundPosition',`-${left*2}px -${top*2}px`)
        })
        //添加购物车
        $('.details>.details_main>.top>.info>.btn>span>a').on('click',function(){
            var {title,price,guige,jifen}=product;
            var uid=sessionStorage.getItem('uid');
            var uname=sessionStorage.getItem('uname');
            console.log(uid);
            console.log(uname);
            var pic=pics[0].sm;
            var href=`details.html?lid=${lid}`;
            var count=$('.details>.details_main>.top>.info>.num>ul>li>input').val();
            if($(this).is('a')){
                $.ajax({
                    url:'http://127.0.0.1:3000/cart/addCart',
                    type:'post',
                    data:{lid,uid,uname,title,href,pic,price,count,jifen,guige},
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
    $.ajax({
        url:'http://localhost:3000/index',
        type:'get',
       data:'uid='+uid, //--因为后端测试时没有加？所以不用加data==undefined
        dataType:'json'  //告诉ajax将json字符串转换为对象
    })
    .then(res=>{
        var {cart}=res;
        html='';
        for(var ca of cart){
            // console.log(ca);
            // console.log(ca.href);
            html+=`<ul>
            <li><a href="${ca.href} target='cart'"><img src="${ca.pic}" alt="${ca.title}"></a></li>
            <li><a href="${ca.href} target='cart'">${ca.title}</a></li>
            <li>${ca.count}</li>
            <li>${ca.price.toFixed(2)}</li>
        </ul>`;
        }
        var cart=$('.right .cart .cart_list');
        cart.html(html);

        //右侧购物车
        if(uname){
            //console.log(res.cart);
            $('.right>.right-menu>li:first-child>span').html(res.cart.length).parent().on('click',function(){
                console.log(2)
                $('.right>.cart>.to_buy>p>span:nth-child(2)').html(res.cart.length);
                var li=$('.right>.right-menu>li:first-child');
                console.log(li);
                if(li.parent().next('.cart').hasClass('hide')){
                    li.parent().next('.cart').removeClass('hide');
                }else{
                    li.parent().next('.cart').addClass('hide');

                }
            })

        }else{
            $('.right>.right-menu>li:first-child>span').html('0');

        }
        

    })

})