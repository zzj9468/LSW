$(function(){
    //search上面菜单栏
    $('.search>.search_main>.menu_info>.menu_list>h3').on('mouseenter',function(){
        var h=$(this);
        if(h.next().hasClass('hidden')){
            h.next().removeClass('hidden').parent().siblings().children('div').addClass('hidden');
        }else{
            h.parent().siblings().children('div').addClass('hidden');

        }
    })
    $('.search>.search_main>.menu_info>.menu_list').on('mouseleave',function(){
        $('.search>.search_main>.menu_info>.menu_list>div').addClass('hidden');
    })

    var pno=0;
    function loadPage(no=0){
        pno=no;
       // console.log(pno);
    //获取的数据
    if(location.search.indexOf('kwords')!==-1){
        
        var kwords=location.search.split('=')[1];
        $.ajax({
            url:'http://127.0.0.1:3000/search',
            type:'get',
            data:{pno,kwords},
            dataType:'json'
        })
        .then(res=>{
            console.log(res);
            if(res.count>0){
            var {products}=res;
            var html='';
            for(var p of products){
                html+=`<li>
                <a href="${p.hrefs}">
                    <img src="${p.imgs}" alt="${p.subtitle}">
                    <span></span>
                </a>
                <p>${p.title}</p>
            <p>￥${p.prices.toFixed(2)}<del>￥${p.p_price.toFixed(2)}</del></p>
            </li>`;
            }
           $('.search>.search_main>.container_info>div>ul').html(html);


            var {pno,pageCount}=res;
            var html=`<a href="javascript:;" ${pno==0?'style="pointer-events:none;opacity:0.6"':''}>上一页</a>`;//html:47
            for(var i=0;i<pageCount;i++){
              html+=`<a href="javascript:;" ${pno==i?'active class="a_hover"':''}">${i+1}</a>
              `;//html:49
            }
            html+=`<a href="javascript:;"  ${pno==pageCount-1?'style="pointer-events:none;opacity:0.6"':''}>下一页</a>`;//html:51行
            $(".search>.search_main>.container_info>.page").html(html);

        }else{
            $('.err').removeClass('hidden');
            page.addClass('hidden');
            console.log($('.logo>.logo_main>ul>li>input').val());
            $('.err>div>p>span').html($('.logo>.logo_main>ul>li>input').val());
    
        }
    
    })
   
    }
    }
        loadPage();
         var page=$(".page").on(
          "click",
          "a:not(.disabled):not(.active)",
          function(e){
            e.preventDefault();
            //console.log(e.target);
            var $a=$(this);
            //console.log($a.is(":first-child"));
            if($a.is(":first-child")){
              loadPage(pno-1);
            }else if($a.html()==="下一页"){
              loadPage(pno+1);
            }else{ 
                console.log($a.html()-1);
                loadPage(pno=$a.html()-1)
             }
          }
        )

})