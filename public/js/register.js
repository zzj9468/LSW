$(function(){
    var uname=$('.uname').val();
    var phone=$('.tel').val();
    var email=$('.email').val();
    var upwd=$('upwd').val();
    var y=0;
   //获得焦点是验证
    function get(any,input){
        var span=$(`${any}`).next();
        span.html(`请输入${input}`); 
    } 
    //手机号
    $('.tel').focus(function(){
        get('.tel','11位正确电话号码');
    })
    //用户名
    $('.uname').focus(function(){
        get('.uname','4~12位字母数字_的组合');
    })
    //邮箱
    $('.email').focus(function(){
        get('.email','正确格式的邮箱地址');
    })

    //失去焦点时验证
    function vali(search,url,regX,t){
        var s=$(`${search}`).val();
        $.ajax({
            url:`http://127.0.0.1:3000/register/${url}`,
            type:'post',
            data:`${url}=`+s,
            dataType:'json',
            success:function(res){
                //console.log(res);
                var span=$(`${search}`).next();
                if(res.code<1){
                    span.html(res.msg);
                    span.css('color','red');
                    $(`${search}`).css('background','url("../img/register/error.png") 252px 6px no-repeat');
                    //console.log(res);
                }else{
                    var reg=regX;
                    if(!s){
                        span.html(`${t}不允许为空`); 
                        span.css('color','red');
                        $(`${search}`).css('background','url("../img/register/error.png") 252px 6px no-repeat');
                    }else if(reg.test(s)){
                        span.html('通过');
                        span.css('color','#5BAC00');
                        $(`${search}`).css('background','url("../img/register/ok.png") 252px 6px no-repeat');
                        y++;
                        console.log(y);
                    }
                    else{
                        span.html(`${t}格式不正确`);
                        span.css('color','red');
                        $(`${search}`).css('background','url("../img/register/error.png") 252px 6px no-repeat');
    
                        }

                }
            }
        })

    }
    console.log('第一'+y);

    //手机号
    $('.tel').blur(function(){
        vali('.tel','phone',/^\d{11}$/,'手机');

    })
    // 用户名
    $('.uname').blur(function(){
        vali('.uname','uname',/^\w{4,16}$/,'用户名');

    })
    // 邮箱
    $('.email').blur(function(){
        vali('.email','email',/^\w{1,}@\w{1,}[.]\w{1,}$/,'邮箱');

    })
    //密码
    $('.upwd').blur(function(){
        upwd=$('.upwd').val();
        var span=$('.upwd').next();
        var reg=/^\d{6}$/;
        if(!upwd){
            span.html('密码不允许为空');
            span.css('color','red');
            $('.upwd').css('background','url("../img/register/error.png") 252px 6px no-repeat');

        }else if(reg.test(upwd)){
            span.html('通过');
            span.css('color','#5BAC00');
            $('.upwd').css('background','url("../img/register/ok.png") 252px 6px no-repeat');

            y++;
         
        }else{
            span.html('密码格式不正确');
            span.css('color','red');
            $('.upwd').css('background','url("../img/register/error.png") 252px 6px no-repeat');

        }

    })   
    console.log("第二个fdnjn"+y);
    //确认密码
    $('.reUpwd').blur(function(){
        var upwd=$('.upwd').val();
        var reUpwd=$('.reUpwd').val();
        var span=$('.reUpwd').next();
        if(!reUpwd){
            span.html('确认密码不允许为空');
            span.css('color','red');
            $('.reUpwd').css('background','url("../img/register/error.png") 252px 6px no-repeat');

        }
        else if(upwd==reUpwd){
            span.html('通过');
            span.css('color','#5BAC00');
            $('.reUpwd').css('background','url("../img/register/ok.png") 252px 6px no-repeat');

            y++;
            console.log(y);
        }else{
            span.html('两次输入的密码不一致');
            span.css('color','red');
            $('.reUpwd').css('background','url("../img/register/error.png") 252px 6px no-repeat');

        }

    })
    //验证码图
    var can=document.getElementsByTagName('canvas')[0];
    var ct=can.getContext('2d');
    var a=$('.ch');
    function yanzhen(){
                //创建矩形120*30，背景颜色随机
                ct.fillStyle=rc(180,230);
                ct.fillRect(0,0,120,30);
                //创建随机字符串4绘制矩形中
                var pool="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
                var code='';
                for(var i=0;i<4;i++){
                    var c=pool[rn(0,pool.length)];
                    ct.fillStyle=rc(20,110);
                    var fs=rn(20,30)
                    ct.font=`${fs}px SimHei`;
                    ct.textBaseline='top';
                    ct.fillText(c,25*i,0);
                    code+=c
                      
                }  
                //创建 5条干扰线
                for(var i=0;i<5;i++){
                    ct.beginPath();
                    ct.strokeStyle=rc(0,230);
                    ct.moveTo(rn(0,120),rn(0,30));
                    ct.lineTo(rn(0,120),rn(0,30));
                    ct.stroke();
                }
                //50个干扰点
                for(var i=0;i<50;i++){
                    ct.fillStyle=rc(0,255);
                    ct.beginPath();
                    ct.arc(rn(0,120),rn(0,30),1,0,2*Math.PI);
                    ct.fill();
                }
                function rn(min,max){
                    var n=Math.random()*(max-min)+min;
                    return Math.floor(n);
                }
                function rc(min,max){
                    var r=rn(min,max);
                    var g=rn(min,max);
                    var b=rn(min,max);
                    return `rgb(${r},${g},${b})`;
                } 
                 return code; 
        
    }
   var reCode=yanzhen();
    a.click(function(){
        reCode=yanzhen();
    })
    //输入验证码

    $('.code').blur(function(){ 
        var span=$('.code').next();
        if(!$('.code').val()){
            span.html('验证码不允许为空');
            span.css('color','red');
            $('.code').css('background','url("../img/register/error.png") 252px 6px no-repeat');

        }
        else if($('.code').val().toUpperCase()==reCode.toUpperCase()){
            span.html('通过');
            span.css('color','#76C61D');
            $('.code').css('background','url("../img/register/ok.png") 252px 6px no-repeat');
            y++;
            console.log(y);
        }else{
            span.html('验证码输入错误');
            span.css('color','red');
            $('.code').css('background','url("../img/register/error.png") 252px 6px no-repeat');

        }
    })
    
    console.log("全局的"+y)
    console.log(156456456)

    // 点击按钮
    $(".register").on('click',function(e){
        var uname=$('.uname').val();
        var phone=$('.tel').val();
        var email=$('.email').val();
        var upwd=$('.upwd').val();
        $.ajax({
            url:'http://localhost:3000/register/click',
            type:'post',
            data:{uname,phone,email,upwd},
            dataType:'json',
            success:function(res){
                // console.log(res);
                // console.log(y);
                // console.log($(':input[type=checkbox]').prop('checked'));

                console.log("最后的"+y)
                console.log(12654)
            if(y==6&&$(':input[type=checkbox]').prop('checked')==true&&res.code==1){
                $('register').prop('disabled','');

                alert('注册成功！');
                console.log('注册成功');
                location.href=`login.html?uname=${uname}`
            }else{ 
                alert(`注册失败`);
               $('register').prop('disabled');
               
            
             }
            }
        })
    })



    // $(".register").on('submit',function(e){
    //             console.log(y)
    //             console.log(12654)
    //         if(y==6&&$(':input[type=checkbox]').prop('checked')==true){
    //             alert('注册成功！');
    //             console.log('注册成功');
    //             location.href=`login.html?uname=${uname}`
    //         }else{ 
    //             alert(`注册失败`);
    //             e.preventDefault();
               
            
    //          }
    //         })


})