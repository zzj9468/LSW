$(function(){
    $("<link rel='stylesheet' href='css/header.css'>").appendTo("head");
    $.ajax({
      url:"header.html",
      type:"get",
      success:function(res){
        //res->html片段
        //console.log(res);
        $(res).replaceAll(".header");
        var uname=sessionStorage.getItem('uname');
        //console.log(uname);
        //console.log($('.header>.header_main>ul>li:nth-child(4)>a'));
        var login=$('.header>.header_main>ul>li:nth-child(4)>a');
        var register=$('.header>.header_main>ul>li:nth-child(5)>a');
        if(uname){
        var html=`${uname}&nbsp;&nbsp;欢迎回来`;
        register.html(html).attr('href','javascript:;'); 
        login.attr('href','javascript:;');
        login.html('退出').on('click',function(){
            sessionStorage.removeItem('uname');
            location.replace('index.html');
            
        })
        }
        $('header>.logo>.logo_main>ul:first-child>li>button').on('click',function(){
          var kwords=$(this).prev().val();
          if(kwords.trim()!==''){
            location.href='search.html?kwords='+kwords;
          }
      })
      .prev().keyup(function(e){
        if(e.keyCode==13){
          $(this).next().click();
        }
      })
      .next().next().children('a').on('click',function(){
        //console.log($(this).html());
        $('header>.logo>.logo_main>ul:first-child>li>input').val($(this).html()).next().click()
      })
      if(location.search.indexOf('kwords=')!=-1){

        $('header>.logo>.logo_main>ul:first-child>li>input').val(
          decodeURIComponent(
            location.search.split('=')[1]
          )
        );
      }

      }  
    }) 
})