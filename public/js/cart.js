$(function(){
    var uid=sessionStorage.getItem('uid');
        //1、header欢迎登录
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
             
            //2、获取用户购物车
                var $tbody=$('.my_cart>.my_cart_main>table>tbody');
                var html='';
                for(var c of res){
                    html+=`<tr>
                    <td class="cf">
                        <input type="checkbox" data-lid=${c.lid}>
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

                //3、如果购物车没有物品，显示快去抢购
                if($tbody.html()!==''){   
                    $('.my_cart>.my_cart_main>.empty').addClass('hidden').prev().removeClass('hidden');
                   //点击+-号时的数量的增加/减少
                    $('tbody>tr>td>div>a').on('click',function(){
                        var a=$(this)
                        var i=a.parent().parent().parent().index();
                        var count=parseInt($(`tbody>tr:nth-child(${i+1})>td>div>span`).html());
                       if(a.html()=='+')
                        count++; 
                       else if(count>1)
                        count--;
                       $(`tbody>tr:nth-child(${i+1})>td>div>span`).html(count);

                        //4、点击-+号时同时更新数据库
                        var {lid,uid,price,jifen}=res[i];
                        //console.log(lid,uid,count)
                        $.ajax({
                            url:'http://127.0.0.1:3000/cart/upCart',
                            type:'post',
                            data:{lid,uid,count},
                            dataType:'json'
                        })
                        //5、同一行积分和总价的改变
                        a.parent().parent().next().children('span').html((count*price).toFixed(2)).parent().next().children('span').html(count*jifen);
            
            
                        //全选与取消全选
                    $('table>thead>tr:first-child>th>input').on('click',function(){
                        var chbs=$('table>tbody>tr>td:first-child>input');
                        for(var c of chbs){
                            $(c).prop('checked',$(this).prop('checked'));
                        }
                    })
                    var chbs=$('table>tbody>tr>td:first-child>input');
                    chbs.on('click',function(){
                        for(var c of chbs){
                            var unchecked=$('table>tbody>tr>td:first-child>input:not(:checked)');
                            $('table>thead>tr:first-child>th>input').prop('checked',unchecked==null)

                        }
                    })

                        //tfoot中所有商品的总和
                        var jifens=$('tbody>tr>td:nth-child(6)>span()');
                        var prices=$('tbody>tr>td:nth-child(5)>span');
                        var jifen_total=0;
                        var price_total=0;
                        // 遍历每个商品的积分
                        for(var j of jifens){
                            jifen_total+=parseInt($(j).html());
                        }
                        // 遍历每个商品的价格
                        for(var p of prices){
                            var p=parseInt($(p).html());
                            price_total+=p;
                        }
                        //6、tfooot总数和总价的的修改,规格的修改
                        var count_total=0;
                        // 得到每个选购商品的数量
                        var c_Dom=$('tbody>tr>td>div>span');
                        var guige_total=0;
                        for(var i=0;i<c_Dom.length;i++){
                            count_total+=parseInt($(c_Dom[i]).html());
                            guige_total+=res[i].guige*parseInt($(c_Dom[i]).html());
                        }
                        var box_weight=parseInt($('tfoot>tr>td>div.submit>p:first-child>span:last-child()').html());
                        $('tfoot>tr>td>.delete>.del_right>span:nth-child(4)').html(`￥ ${price_total.toFixed(2)}`).prev().prev().html(count_total).parent().parent().next().children().children('a').prev().html(`￥ ${price_total.toFixed(2)}`).prev().prev().html(jifen_total).parent().prev().children(':nth-child(4)').html(`${guige_total}g`).prev().prev().html(`${guige_total+box_weight}g`);

                })
                }else{
                    $('.my_cart>.my_cart_main>.empty').removeClass('hidden').prev().addClass('hidden');
                }



         })
            login.html('退出').on('click',function(){
                sessionStorage.removeItem('uname');
                sessionStorage.removeItem('uid');
                location.replace('cart.html');
                
            })
        }
  
})
