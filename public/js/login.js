$(function(){
     $('.content_02 button').on('click',function(){
         console.log(1213)
         var uname=$('.uname').val();
        // console.log(uname);
         var upwd=$('.upwd').val();
         var reg=/[@]/;
        if(!uname|| !upwd){
            alert('用户名和密码不允许为空');
        }
        else if(!reg.test(uname)){
            $.ajax({
                url:'http://127.0.0.1:3000/login/uname',
                type:'post',
                data:{uname,upwd},
                dataType:'json',
                success:function(res){
                    if(res.code<1){
                        alert(`登录失败，请检查用户名、密码是否正确`);
                    } else{
                        alert('登陆成功');
                    }
                }
            })
         }else{
            email=$('.uname').val(); 
            $.ajax({
                url:'http://127.0.0.1:3000/login/email',
                type:'post',
                data:{email,upwd},
                dataType:'json',
                success:function(res){
                        if(res.code<1){
                        alert(`登录失败，请检查用户名、密码是否正确`);
                    } else{
                        alert('登陆成功');
                    }
                }
            })

         }
     });
})