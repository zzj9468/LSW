window.onload=function(){
    ajax({
        url:'http://localhost:3000/index',
        type:'get',
        //data:--因为后端测试时没有加？所以不用加data==undefined
        dataType:'json'  //告诉ajax将json字符串转换为对象
    })
    .then(res=>{
        console.log(res);
        var {carousel,miaosha,hot,f1,f2,f3,f4,f5,cart}=res;
        //console.log(carousel,miaosha,hot,f1,f2,f3,f4,f5,cart);
        var html='';
        for(var c of carousel){
         var html=html+`<li><a href="${c.href}"><img src="${c.img}" alt="${c.tilte}"></a></li>`
}        
        var div=document.querySelector('.banner .banner_main .img');
        div.innerHTML+=html;
        for(var ca of cart){
            var html_cart=html_cart+`<ul>
            <li><a href=""><img src="${ca.href}" alt="${ca.tilte}"></a></li>
            <li><a href="${ca.href}">${ca.tilte}</a></li>
            <li>${ca.count}</li>
            <li>${cs.price}</li>
        </ul>`;
        }
        var cart=document.querySelector('.right .cart .cart_list');
        cart.innerHTML=html_cart;
    })  
}