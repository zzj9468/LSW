$(function(){
    ajax({
        url:'http://localhost:3000/index',
        type:'get',
        //data:--因为后端测试时没有加？所以不用加data==undefined
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
        var div=$('.banner .banner_main .img');
        div.innerHTML+=html;

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
        //左侧菜单栏
        $('.banner>.banner_main>.menu>.menu_list>h3>a').on('click',function(){
            var a=$(this);
            console.log(('.banner>.banner_main>.menu>.menu_list>h3>a'));
        })
    })  
})