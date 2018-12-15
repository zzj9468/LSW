$(function(){
    $.ajax({
        url:'http://localhost:3000/cart',
        type:'get'
    }).then(res=>{
        console.log(res);
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
})
