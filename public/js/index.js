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
        //console.log(carousel,miaosha,hot,f1,f2,f3,f4,f5,cart);

/***************轮播****************/
        var html='';
        for(var c of carousel){
         var html=html+`<li><a href="${c.href}"><img src="${c.img}" alt="${c.tilte}"></a></li>`
}        
        var div=$('.banner>.banner_main>.img');
        //console.log(div);
        div.html(html);

/***************右侧****************/
        html='';
        for(var ca of cart){
            // console.log(ca);
            // console.log(ca.href);
            html+=`<ul>
            <li><a href="${ca.href}"><img src="${ca.pic}" alt="${ca.title}"></a></li>
            <li><a href="${ca.href}">${ca.title}</a></li>
            <li>${ca.count}</li>
            <li>${ca.price.toFixed(2)}</li>
        </ul>`;
        }
        var cart=document.querySelector('.right .cart .cart_list');
        cart.innerHTML=html;
        
/***************秒杀****************/
        var mh=document.querySelector('.sec_kill .kill_main .kill-content .kill_2 ul');
        var html='';
        for(var m of miaosha){
            html+=`<li>
            <p><a href="${m.href}">  <img src="${m.img}" title="${m.title}"></a></p>
            <p><a href="${m.href}">${m.title}</a></p>
            <p>¥ ${m.price.toFixed(2)}</p>
        </li>`;
        }
        mh.innerHTML=html;
/***************热卖****************/
        var ht=document.querySelector('.hot_sale .hot_main .hot_content ul');
        var html='';
        for(var h of hot){
            html+=`<li>
            <span></span>
            <p><a href="${h.href}" target="_blank"><img src="${h.img}" title="${h.title}"></a></p>
            <p><a href="${h.href}">${h.title}</a></p>
            <p><a href="javascript:;">¥ ${h.price.toFixed(2)}</a></p>
            </li>`;
        }
        ht.innerHTML=html;
/***************1楼****************/
        var h1=document.querySelector('.floor1 .floor_main .content');

        var h1_1_html=`<ul class="cf active">${tem(f1_1)}</ul>`
        var h1_2_html=`<ul class="cf hidden">${tem(f1_2)}</ul>`;
        var h1_3_html=`<ul class="cf hidden">${tem(f1_3)}</ul>`;
        var h1_4_html=`<ul class="cf hidden">${tem(f1_4)}</ul>`;
        //console.log(h1_1_html,h1_2_html,h1_3_html,h1_4_html);
        var h1_html=`<div>
        <a href=""><img src="img/sm/1f.jpg" title="饼干糕点"></a>
    </div>${h1_1_html+h1_2_html+h1_3_html+h1_4_html}</div>`;
        h1.innerHTML=h1_html;

/***************2楼****************/
        var h2=document.querySelector('.floor2 .floor_main .content');

        var h2_1_html=`<ul class="cf active">${tem(f2_1)}</ul>`
        var h2_2_html=`<ul class="cf hidden">${tem(f2_2)}</ul>`;
        //console.log(h1_1_html,h1_2_html,h1_3_html,h1_4_html);
        var h2_html=`<div>
        <a href=""><img src="img/sm/2f.jpg" title="肉类制品"></a>
    </div>${h2_1_html+h2_2_html}</div>`;
        h2.innerHTML=h2_html;
/***************3楼****************/
        var h3=document.querySelector('.floor3 .floor_main .content');

        var h3_1_html=`<ul class="cf active">${tem(f3_1)}</ul>`
        var h3_2_html=`<ul class="cf hidden">${tem(f3_2)}</ul>`;
        var h3_3_html=`<ul class="cf hidden">${tem(f3_3)}</ul>`;
        var h3_html=`<div>
        <a href=""><img src="img/sm/3f.jpg" title="原味糖果"></a>
        </div>${h3_1_html+h3_2_html+h3_3_html}</div>`;
        h3.innerHTML=h3_html;

/***************4楼****************/
        var h4=document.querySelector('.floor4 .floor_main .content');

        var h4_1_html=`<ul class="cf active">${tem(f4_1)}</ul>`
        var h4_2_html=`<ul class="cf hidden">${tem(f4_2)}</ul>`;
        var h4_html=`<div>
        <a href=""><img src="img/sm/4f.jpg" title="蜜饯果干"></a>
        </div>${h4_1_html+h4_2_html}</div>`;
        h4.innerHTML=h4_html;


/***************5楼****************/
        var h5=document.querySelector('.floor5 .floor_main .content');

        var h5_1_html=`<ul class="cf">${tem(f5_1)}</ul>`
       // console.log(tem(f5_1));
        var h5_html=`<div>
        <a href=""><img src="img/sm/5f.jpg" title="坚果炒货"></a>
        </div>${h5_1_html}</div>`;
        h5.innerHTML=h5_html;

        //模板
        function tem(ch){
            var html='';
            //console.log(ch);
            for(var f of ch){   
               // console.log(f.hrefs);
                 html+=`<li>
                <p><a href="${f.hrefs}" target="_blank"><img src="${f.imgs}" alt="${f.title}"></a></p>
                <a href="">${f.title}</a><span>¥${f.prices.toFixed(2)}</span></li>
                `;
            }
            return html;

        }
        //登录

        //banner上面菜单栏
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
        //楼层标题点击时
        //1
        $('.floor1>.floor_main>.title>ul>li').on('click',function(){
            var li=$(this);
        btn(1,li);
        })
        //2
        $('.floor2>.floor_main>.title>ul>li').on('click',function(){
            var li=$(this);
        btn(2,li);
        })
        //3
        $('.floor3>.floor_main>.title>ul>li').on('click',function(){
            var li=$(this);
        btn(3,li);
        })

        //4
        $('.floor4>.floor_main>.title>ul>li').on('click',function(){
            var li=$(this);
        btn(4,li);
        })

        //5
        $('.floor5>.floor_main>.title>ul>li').on('click',function(){
            var li=$(this);
        btn(5,li);
        })
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
        //左侧导航
        $(window).scroll(function(){
            var item=$('.left>.left_main>ul>li');
            //console.log($(window).scrollTop());
           // console.log(item)
           if($(window).scrollTop()<400){
            $('.left>.left_main>ul>li').removeClass('click');
           } else if($(window).scrollTop()<800){
                //console.log($('.left>.left_main>ul>li:first-child'));
                if(!$('.left>.left_main>ul>li:first-child').hasClass('click'))
                $('.left>.left_main>ul>li:first-child').addClass('click')
                $('.left>.left_main>ul>li:first-child').siblings().removeClass('click')
            }else if($(window).scrollTop()<1200){
                if(!$('.left>.left_main>ul>li:nth-child(2)').hasClass('click'))
                $('.left>.left_main>ul>li:nth-child(2)').addClass('click')
                $('.left>.left_main>ul>li:nth-child(2)').siblings().removeClass('click')

            }else if($(window).scrollTop()<1800){
                if(!$('.left>.left_main>ul>li:nth-child(3)').hasClass('click'))
                $('.left>.left_main>ul>li:nth-child(3)').addClass('click')
                $('.left>.left_main>ul>li:nth-child(3)').siblings().removeClass('click')

            }else if($(window).scrollTop()<2400){
                if(!$('.left>.left_main>ul>li:nth-child(4)').hasClass('click'))
                $('.left>.left_main>ul>li:nth-child(4)').addClass('click')
                $('.left>.left_main>ul>li:nth-child(4)').siblings().removeClass('click')

            }else if($(window).scrollTop()<3000){
                if(!$('.left>.left_main>ul>li:nth-child(5)').hasClass('click'))
                $('.left>.left_main>ul>li:nth-child(5)').addClass('click')
                $('.left>.left_main>ul>li:nth-child(5)').siblings().removeClass('click')

            }else if($(window).scrollTop()<3500){
                if(!$('.left>.left_main>ul>li:nth-child(6)').hasClass('click'))
                $('.left>.left_main>ul>li:nth-child(6)').addClass('click')
                $('.left>.left_main>ul>li:nth-child(6)').siblings().removeClass('click')

            }else{
                if(!$('.left>.left_main>ul>li:nth-child(7)').hasClass('click'))
                $('.left>.left_main>ul>li:nth-child(7)').addClass('click')
                $('.left>.left_main>ul>li:nth-child(7)').siblings().removeClass('click')

            }
        })
        $('.left>.left_main>ul>li').on('click',function(){
            var i=$(this).index();
            $('html,body').animate({scrollTop:`${i*550+400}px`}, 600);
        })
        //右侧购物车    
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
        //计时
        
    })  
})