$(function(){
    var uname=sessionStorage.getItem('uname');
    var uid=sessionStorage.getItem('uid');
    //console.log(uid);
    $.ajax({
        url:'http://localhost:3000/index',
        type:'get',
       data:'uid='+uid, //--因为后端测试时没有加？所以不用加data==undefined
        dataType:'json'  //告诉ajax将json字符串转换为对象
    })
    .then(res=>{
        console.log(res);
        var {carousel,miaosha,hot,f1_1,f1_2,f1_3,f1_4,f2_1,f2_2,f3_1,f3_2,f3_3,f4_1,f4_2,f5_1,cart}=res;

/***************1.轮播****************/
        var html='';
        for(var c of carousel){
         var html=html+`<li><a href="${c.href} target='detail'"><img src="${c.img}" alt="${c.tilte}"></a></li>`
}        
        var div=$('.banner>.banner_main>.img');
        div.html(html);
 
/***************2.右侧****************/
        html='';
        for(var ca of cart){
            html+=`<ul>
            <li><a href="${ca.href} target='cart'"><img src="${ca.pic}" alt="${ca.title}"></a></li>
            <li><a href="${ca.href} target='cart'">${ca.title}</a></li>
            <li>${ca.count}</li>
            <li>${ca.price.toFixed(2)}</li>
        </ul>`;
        }
        var cart=$('.right .cart .cart_list');
        cart.html(html);
        
/***************3.秒杀****************/
        var mh=$('.sec_kill .kill_main .kill-content .kill_2 ul');
        var html='';
        for(var m of miaosha){
            html+=`<li>
            <p><a href="${m.href}" target='detail'>  <img src="${m.img}" title="${m.title}"></a></p>
            <p><a href="${m.href} target='detail'">${m.title}</a></p>
            <p>¥ ${m.price.toFixed(2)}</p>
        </li>`;
        }
        mh.html(html);
/***************4.热卖****************/
        var ht=$('.hot_sale .hot_main .hot_content ul');
        var html='';
        for(var h of hot){
            html+=`<li>
            <span></span>
            <p><a href="${h.href}" target="detail"><img src="${h.img}" title="${h.title}"></a></p>
            <p><a href="${h.href} target='detail'">${h.title}</a></p>
            <p><a href="javascript:;">¥ ${h.price.toFixed(2)}</a></p>
            </li>`;
        }
        ht.html(html);
/***************5.1楼****************/
        var h1=$('.floor1 .floor_main .content');
        html='';
        html=`<div>
        <a href=""><img src="img/sm/1f.jpg" title="饼干糕点"></a>
            </div>
            <ul class="cf active">${tem(f1_1)}</ul>
            <ul class="cf hidden">${tem(f1_2)}</ul>
            <ul class="cf hidden">${tem(f1_3)}</ul>
            <ul class="cf hidden">${tem(f1_4)}</ul></div>`;
        h1.html(html);

/***************5.2楼****************/
        var h2=$('.floor2 .floor_main .content');
        html=`<div>
        <a href=""><img src="img/sm/2f.jpg" title="肉类制品"></a>
        </div><ul class="cf active">${tem(f2_1)}</ul>
            <ul class="cf hidden">${tem(f2_2)}</ul></div>`;
        h2.html(html);
/***************5.3楼****************/
        var h3=$('.floor3 .floor_main .content');
        html=`<div>
        <a href=""><img src="img/sm/3f.jpg" title="原味糖果"></a>
        </div><ul class="cf active">${tem(f3_1)}</ul>
            <ul class="cf hidden">${tem(f3_2)}</ul>
            <ul class="cf hidden">${tem(f3_3)}</ul></div>`;
        h3.html(html);

/***************5.4楼****************/
        var h4=$('.floor4 .floor_main .content');
        html=`<div>
        <a href=""><img src="img/sm/4f.jpg" title="蜜饯果干"></a>
        </div><ul class="cf active">${tem(f4_1)}</ul>
                <ul class="cf hidden">${tem(f4_2)}</ul></div>`;
        h4.html(html);

/***************5.5楼****************/
        var h5=$('.floor5 .floor_main .content');
        html=`<div>
        <a href=""><img src="img/sm/5f.jpg" title="坚果炒货"></a>
        </div><ul class="cf">${tem(f5_1)}</ul></div>`;
        h5.html(html);

        //楼层遍历模板
        function tem(ch){
            var html='';
            //console.log(ch);
            for(var f of ch){   
               // console.log(f.hrefs);
                 html+=`<li>
                <p><a href="${f.hrefs}" target="detail"><img src="${f.imgs}" alt="${f.title}"></a></p>
                <a href="">${f.title}</a><span>¥${f.prices.toFixed(2)}</span></li>
                `;
            }
            return html;

        }
        //6.banner上面菜单栏
        $('.banner>.banner_main>.menu>.menu_list>h3').on('mouseenter',function(){
            var h=$(this);
            if(h.next().hasClass('hidden')){
                h.next().removeClass('hidden').parent().siblings().children('div').addClass('hidden');
            }else{
                h.parent().siblings().children('div').addClass('hidden');

            }
        })
        $('.banner>.banner_main>.menu>.menu_list').on('mouseleave',function(){
            $('.banner>.banner_main>.menu>.menu_list>div').addClass('hidden');
        })
        //7.楼层标题点击时
        //1
        $('.floor1>.floor_main>.title>ul>li').on('click',function(){var li=$(this); btn(1,li);})
        //2
        $('.floor2>.floor_main>.title>ul>li').on('click',function(){var li=$(this);btn(2,li);})
        //3
        $('.floor3>.floor_main>.title>ul>li').on('click',function(){var li=$(this);btn(3,li);})
        //4
        $('.floor4>.floor_main>.title>ul>li').on('click',function(){var li=$(this);btn(4,li);})
        //5
        $('.floor5>.floor_main>.title>ul>li').on('click',function(){var li=$(this);btn(5,li);})
        //楼层调用函数
        function btn(f,li){
            var length=parseInt($(`.floor${f}>.floor_main>.title>ul>li`).length);
            var i=length-parseInt(li.index());
           var ul=$(`.floor${f}>.floor_main>.content>ul:nth-child(${i+1})`);
            if(ul.hasClass('hidden')){
                ul.removeClass('hidden').addClass('active').siblings("ul").addClass('hidden');
            }else{
                ul.addClass('active').siblings("ul").removeClass('active').addClass('hidden');
            }

        }
        //8.左侧导航
        $(window).scroll(function(){
            var item=$('.left>.left_main>ul');
            $(window).scrollTop()<400?item.children('li').removeClass('click'):$(window).scrollTop()<800?
                    item.children(':first-child').addClass('click').siblings().removeClass('click'):
                    $(window).scrollTop()<1200?item.children(':nth-child(2)').addClass('click').siblings().removeClass('click'):
                    $(window).scrollTop()<1800?item.children(':nth-child(3)').addClass('click').siblings().removeClass('click'):
                    $(window).scrollTop()<2400?item.children(':nth-child(4)').addClass('click').siblings().removeClass('click'):
                    $(window).scrollTop()<3000?item.children(':nth-child(5)').addClass('click').siblings().removeClass('click'):
                    $(window).scrollTop()<3500?item.children(':nth-child(6)').addClass('click').siblings().removeClass('click'):
                    item.children(':nth-child(7)').addClass('click').siblings().removeClass('click')

        })
        $('.left>.left_main>ul>li').on('click',function(){
            var i=$(this).index();
            $('html,body').animate({scrollTop:`${i*550+400}px`}, 600);
        })
        //9.右侧购物车    
        if(uname){
            //console.log(res.cart);
            $('.right>.right-menu>li:first-child>span').html(res.cart.length).parent().on('click',function(){
                $('.right>.cart>.to_buy>p>span:nth-child(2)').html(res.cart.length);
                var li=$(this);
                if(li.parent().next('.cart').hasClass('hidden')){
                    li.parent().next('.cart').removeClass('hidden');
                }else{
                    li.parent().next('.cart').addClass('hidden');
                }
            })
        }else{
            $('.right>.right-menu>li:first-child>span').html('0');
        }
         //10.计时
        setInterval(function time(){
            var now=new Date();
            var old=new Date('2019/11/11 00:00:00');
            //总的时间
            var s=parseInt((old-now)/1000);
            if(s>0){
                //天
                var d=parseInt(s/3600/24)
                if(d<10) d='0'+d;
                //时
                var h=parseInt(s%(3600*24)/3600);
                if(h<10) h='0'+h;
                //分
                var m=parseInt(s%3600/60);
                if(m<10) m='0'+m;
                //秒
                s%=60;
                if(s<10) s='0'+s;
                var html= `<li>秒</li><li class="second"><a>${s}</a></li>
                            <li>分</li><li class="minute"> <a>${m}</a></li>
                            <li>时</li><li class="hour"><a>${h}</a></li>
                            <li>天</li><li class="date"><a>${d}</a></li>
                            <li>剩余时间:</li>`;
                    $('.sec_kill>.kill_main>.title>ul.time').html(html);
            }else{
                    $('.sec_kill>.kill_main>.title>ul.time').html('秒杀活动已结束，请下次再来');
                }

        },1000)
        //11.轮播
            //11.1小圆点
        $('.banner>.banner_main>ul.circle>li').on('mouseenter',function(){
            var c=$(this);
            var index=c.index();
            console.log(c.index());
            c.addClass('hover').siblings().removeClass('hover');
            $('.banner>.banner_main>ul.img>li').eq(index).removeClass('hidden').siblings().addClass('hidden');
        
        }) 
        //11.2图片定时器
        function time(){
            var i=0;
            setInterval(function(){
                    if(i<4){
                    $('.banner>.banner_main>ul.circle>li').eq(i).addClass('hover').siblings().removeClass('hover');
                    $('.banner>.banner_main>ul.img>li').eq(i).removeClass('hidden').siblings().addClass('hidden');
                    i++;
                }else{
                    i=-1;
                }
            },1000)

         }
        time();

        })

})