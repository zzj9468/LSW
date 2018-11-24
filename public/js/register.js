$(function(){
    $(".register").click(function(){
        var uname=$('.uname').val();
        var phone=$('.phone').val();
        var email=$('.email').val();
        var upwd=$('upwd').val();
        $.ajax({
            url:'http://localhost:3000/users/register',
            type:'post',
            data:{uname,phone,email,upwd},
            dataType:'json',
            success:function(res){
                console.log(res);
            }
        })
    })
})