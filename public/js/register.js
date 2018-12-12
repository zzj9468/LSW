$(function(){
    var uname=$('.uname').val();
    var phone=$('.tel').val();
    var email=$('.email').val();
    var upwd=$('upwd').val();
    $('.tel').blur(function(){
        $.ajax({
            url:'http://localhost:3000/register/phone',
            type:'get',
            data:'phone='+phone,
            dataType:'json',
            success:function(res){
                phone=$('.tel').val();
                console.log(res); 
                var span=$('.tel').next();
                var reg=/^\d{11}$/;
                if(!phone){
                   span.html('手机号不允许为空'); 
                }else if(reg.test(phone)){
                    span.html('通过');
                }
                else{
                    span.html('手机格式不正确');
                }
                console.log(phone);
                //console.log(res);
            }
        })
        // var span=phone.next();
        // if(phone){}
    })
    $(".register").click(function(){
        var uname=$('.uname').val();
        var phone=$('.tel').val();
        var email=$('.email').val();
        var upwd=$('upwd').val();
        $.ajax({
            url:'http://localhost:3000/register',
            type:'post',
            data:{uname,phone,email,upwd},
            dataType:'json',
            success:function(res){
                console.log(res);
            }
        })
    })
})