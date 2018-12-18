$(function(){
    var uid=sessionStorage.getItem('uid');
        //header欢迎登录
        var uname=sessionStorage.getItem('uname');
        var login=$('.header>.header_main>ul>li:nth-child(4)>a');
        var register=$('.header>.header_main>ul>li:nth-child(5)>a');
        if(uname){
            var html=`${uname}&nbsp;&nbsp;欢迎回来`;
            register.html(html).attr('href','javascript:;'); 
            login.attr('href','javascript:;');
            $.ajax({
                url:'http://localhost:3000/cart',
                type:'get',
                data:'uid='+uid,
                dataType:'json'
            }).then(res=>{
            console.log(res);
            //获取用户购物车
                var $tbody=$('.my_cart>.my_cart_main>table>tbody');
                var html='';
                for(var c of res){
                    html+=`<tr>
                    <td class="cf">
                        <input type="checkbox">
                        <a href="${c.href}"><img src="${c.pic}" alt=""></a>
                    </td>
                    <td><a href="${c.href}">${c.title}</a></td>
                    <td>¥<span>${c.price.toFixed(2)}</span>元</td>
                    <td class="cf">
                        <div class="cf">
                            <a href="javascript:;">-</a>
                            <span>${c.count}</span>
                            <a href="javascript:;">+</a>
                        </div>
                    </td>
                    <td>¥<span>${(c.count*c.price).toFixed(2)}</span>元</td>
                    <td><span>${c.jifen*c.count}</span></td>
                    <td><a href="">删除</a></td>
                </tr>`;
                }   
                $tbody.html(html);
            })
            login.html('退出').on('click',function(){
                sessionStorage.removeItem('uname');
                sessionStorage.removeItem('uid');
                location.replace('cart.html');
                
            })
        }
  
})
