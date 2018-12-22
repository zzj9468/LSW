$(function(){
    var uid=sessionStorage.getItem('uid');
        //1、header欢迎登录
        var uname=sessionStorage.getItem('uname');
        var login=$('.header>.header_main>ul>li:nth-child(4)>a');
        var register=$('.header>.header_main>ul>li:nth-child(5)>a');
        if(uname){
            var html=`${uname}&nbsp;&nbsp;欢迎回来`;
            register.html(html).attr('href','javascript:;'); 
            login.html('退出').on('click',function(){
                sessionStorage.removeItem('uname');
                alert('您还没有登录。去登录>>>>');
                location.replace('login.html');
            })
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
                    html+=`<tr data-cid='${c.cid}'>
                    <td class="cf">
                        <input type="checkbox" data-guige=${c.guige}>
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
                    <td><a href="javascript:;">删除</a></td>
                </tr>`;
                }   
                $tbody.html(html);

                //3、如果购物车没有物品，显示快去抢购
                if($tbody.html()!==''){   
                    $('.my_cart>.my_cart_main>.empty').addClass('hidden').prev().removeClass('hidden');
                   
                //4.1.点击+-号时的数量的增加/减少
                $('tbody>tr>td>div>a').on('click',function(){
                    var a=$(this)
                    var i=a.parent().parent().parent().index();
                    var count=parseInt($(`tbody>tr:nth-child(${i+1})>td>div>span`).html());
                    if(a.html()=='+')
                    count++; 
                    else if(count>1)
                    count--;
                    $(`tbody>tr:nth-child(${i+1})>td>div>span`).html(count);

                //4.2、点击-+号时同时更新数据库
                var {lid,uid,price,jifen}=res[i];
                //console.log(lid,uid,count)
                $.ajax({
                    url:'http://127.0.0.1:3000/cart/upCart',
                    type:'post',
                    data:{lid,uid,count},
                    dataType:'json'
                })
                //4.3、同一行积分和总价的改变
                a.parent().parent().next().children('span').html((count*price).toFixed(2)).parent().next().children('span').html(count*jifen);
                sum();
                    })
            
                    //5.全选与取消全选
                $('table>thead>tr>th:first-child>input').on('click',function(){
                    var chbs=$('table>tbody>tr>td:first-child>input'); 
                    $('table>tfoot>tr>td>div.delete>p>input').prop('checked',$(this).prop('checked'));
                    for(var c of chbs){
                        $(c).prop('checked',$(this).prop('checked'));
                        sum();
                    }
                    console.log($(this).prop('checked'));
                    if($(this).prop('checked')){
                        $(this).next().html('取消全选');
                    }else{
                        $(this).next().html('全选');
                    }
                })
                var chbs=$('table>tbody>tr>td:first-child>input');
                chbs.on('click',function(){
                    for(var c of chbs){
                        var unchecked=$('table>tbody>tr>td:first-child>input:not(:checked)');
                        $('table>thead>tr>th:first-child>input').prop('checked',unchecked.length==0);
                        if(unchecked.length>chbs.length-2){
                            $('table>tfoot>tr>td>div.delete>p>input').prop('checked',false);
                            // console.log('选中的个数小于2');

                        }else{
                            $('table>tfoot>tr>td>div.delete>p>input').prop('checked',true);
                            // console.log('选中的大于2');
                        }
                    }
                    sum()
                })

                //6.删除
                    //6.1每一行的删除
                $('table>tbody>tr>td:last-child>a').on('click',function(){
                    var a=$(this);
                    var cid=a.parent().parent().data('cid');
                    if(confirm('你确定要删除此商品吗？？')){
                        del(cid);  
                        a.parent().parent().remove();
                    }
                    
                })
                    //6.2批量删除
                var numDel=$('table>tfoot>tr>td>div.delete>p>a:nth-child(2)').on('click',function(){
                    var a=$(this);
                    console.log(a);
                    var chbs_c=($('table>tbody>tr>td:first-child>input:checked'));
                    var cid='';
                    console.log(chbs_c);
                    for(var c of chbs_c){
                        cid+=($(c).parent().parent().data('cid')+'$');
                    }
                    if(chbs_c.length>0){
                        if(confirm('你确定要删除此商品吗？？')){
                            del(cid);
                            chbs_c.parent().parent().remove();
                            a.prev().prop('checked',false);
                    }
  
                    }

                })
                    //6.3清空购物车
                numDel.next().next().on('click',function(){
                    var cid='';
                    for(var r of res){
                        cid+=(r.cid+'$')
                    }
                    if(confirm('你确定要删除此商品吗？？')){
                        del(cid);
                        $('table>tbody>tr').remove();
                        $('.my_cart>.my_cart_main>.empty').removeClass('hidden').prev().addClass('hidden');

                    }
 
                })

                    //6.4函数--批量删除
                function del(cid){
                    var cid=cid; 
                    console.log(cid);
                    console.log('http://127.0.0.1:3000/cart/delCart?cid='+cid);
                    $.ajax({
                        url:'http://127.0.0.1:3000/cart/delCart?cid='+cid,
                        type:'get',
                    })
                    .then((res)=>{
                        if(res.code>0){
                            console.log('删除成功');
                        }
                    })
                }
                //全局函数--总的积分积分和总价
                function  sum(){
                    var jifen_total=0;
                    var price_total=0;
                    var guige_total=0;
                    var n=0;
                    chbs.each(function(){
                        if($(this).is(':checked')){
                            jifen_total+=parseInt($(this).parent().parent().find(':nth-child(6) span').html());
                            price_total+=parseInt($(this).parent().parent().find(':nth-child(5)> span').html());
                            var count=$(this).parent().parent().children(':nth-child(4)').children().children('span').html();
                            guige_total+=$(this).data('guige')*count; 
                            n+=parseInt(count); 
                            // console.log($(this).data('guige'));                              
                        }    
                    })
                    var box_weight=parseInt($('tfoot>tr>td>div.submit>p:first-child>span:last-child()').html());

                        $('tfoot>tr>td>.delete>.del_right>span:nth-child(4)').html(`￥ ${price_total.toFixed(2)}`).prev().prev().html(n).parent().parent().next().children().children('a').prev().html(`￥ ${(price_total==0?0:price_total<=200?price_total+10:price_total).toFixed(2)}`).prev().html(price_total>200?'总计（不含运费） ：':'总计（含运费￥ 10） ：').prev().html(jifen_total).parent().prev().children(':nth-child(4)').html(`${guige_total}g`).prev().prev().html(`${guige_total==0?0:guige_total+box_weight}g`);
                }

                
                }else{
                    $('.my_cart>.my_cart_main>.empty').removeClass('hidden').prev().addClass('hidden');
                }



         })
            login.html('退出').on('click',function(){
                sessionStorage.removeItem('uname');
                sessionStorage.removeItem('uid');
                location.replace('login.html');
                
            })
        }
  
})
