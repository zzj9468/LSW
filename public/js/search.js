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

    //获取的数据
    if(location.search.indexOf('kwords')!==-1){
        var pno=0;
        var kwords=location.search.split('=')[1];
        $.ajax({
            url:'http://127.0.0.1:3000/search',
            type:'get',
            data:{pno,kwords},
            dataType:'json'
        })
        .then(res=>{
            console.log(res);
            var {products}=res;
            var html='';
            for(var p of products){
                html+=`<li>
                <a href="${p.href}">
                    <img src="${p.imgs}" alt="${p.subtitle}">
                    <span></span>
                </a>
                <p>${p.title}</p>
            <p>￥${p.prices.toFixed(2)}<del>￥${p.p_price.toFixed(2)}</del></p>
            </li>
`;
            }
            $('.search>.search_main>.container_info>div>ul').html(html);
        })
    }
})