<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <title>body</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/round.js'/>"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.ui-banner .ui-banner-slides
{ width:100%;  height:100%; left:1px;}


.ui-bnnerp .floatRight{
width:100% !important ;  height:100% !important;
float:right !important;
}
.ui-bnnerp {
    width: 100%px !important;
    height: 97% !important;
    
}
  *{margin:0; padding:0;}
        body,input{font-size:14px; line-height:24px; color:#333; font-family:Microsoft yahei, Song, Arial, Helvetica, Tahoma, Geneva;}
        h1{margin-bottom:15px; height:100px; line-height:100px; text-align:center; font-size:24px; color:#fff; background:#0051a1;}
        #content #post,#comment p{zoom:1;}
        #content #post:after,#comment p:after{display:block; height:0; clear:both; visibility:hidden; overflow:hidden; content:'.';}
        .transition{-webkit-transition:all 0.5s linear; -moz-transition:all 0.5s linear; -o-transition:all 0.5s linear; -ms-transition:all 0.5s linear; transition:all 0.5s linear;}
        #content{margin:0 auto; width:960px; overflow:hidden;}
        #content #post{margin-bottom:15px; padding-bottom:15px; border-bottom:1px #d4d4d4 dashed;}
        #content #post textarea{display:block; margin-bottom:10px; padding:5px; width:948px; height:100px; border:1px #d1d1d1 solid; border-radius:5px; resize:none; outline:none;}
        #content #post textarea:hover{border:1px #9bdf70 solid; background:#f0fbeb;}
        #content #post #postBt,#content #post #clearBt{margin-left:5px; padding:3px; float:right;}
        #comment{overflow:hidden;}
        #comment p{margin-bottom:10px; padding:10px; border-radius:5px;}
        #comment p:nth-child(odd){border:1px solid #e3e197; background:#ffd;}
        #comment p:nth-child(even){border:1px solid #adcd3c; background:#f2fddb;}
        #comment p span{display:inline; float:left;}
        #comment p .msg{width:738px;}
        #comment p .datetime{width:200px; color:#999; text-align:right;}




a {text-decoration: none;}
.notes{
color: blue;
font-size: 1.2em;
padding-bottom: 10px;
}
.note{
padding-left:12px;
padding-top:3px;
padding-bottom:3px;
margin:1px;
color: red;
font-size: 1;
background-color: #dfdfdf;
}
</style>
  <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <!--企业动态-->
    <script src="js/jquery-ui-1.8.6.core.widget.js"></script>
    <script src="js/jqueryui.bannerize.js"></script>
 	<script type="text/javascript">
    var Storage =
        {
            saveData:function()//保存数据
            {
                var data = document.querySelector("#post textarea");
                if(data.value != "")
                {
                    var time = new Date().getTime() + Math.random() * 5;//getTime是Date对象中的方法，作用是返回 1970年01月01日至今的毫秒数
                    localStorage.setItem(time, data.value + "|" + this.getDateTime());//将毫秒数存入Key值中，可以降低Key值重复率
                    data.value = "";
                    this.writeData();
                }
                else
                {
                    alert("请填写您的留言！");
                }
            },
            writeData:function()//输出数据
            {
                var dataHtml = "", data = "",number="";
                for(var i = localStorage.length-1; i >= 0; i--)//效率更高的循环方法
                {
                    data = localStorage.getItem(localStorage.key(i)).split("|");
                    dataHtml += "<p><span class=\"msg\">"  +data[0] + "</span><span class=\"datetime\">" + data[1] + "</span></p>";
                	
                }
                number=localStorage.length;
                document.getElementById("notes").innerHTML = "留言板("+number+")";
                document.getElementById("comment").innerHTML = dataHtml;
            },
            clearData:function()//清空数据
            {
                if(localStorage.length > 0)
                {
                    if(window.confirm("清空后不可恢复，是否确认清空？"))
                    {
                        localStorage.clear();
                        this.writeData();
                    }
                }
                else
                {
                    alert("没有需要清空的数据！");
                }
            },
            getDateTime:function()//获取日期时间，例如 2012-03-08 12:58:58
            {
                var isZero = function(num)//私有方法，自动补零
                {
                    if(num < 10)
                    {
                        num = "0" + num;
                    }
                    return num;
                }
                
                var d = new Date();
                return d.getFullYear() + "-" + isZero(d.getMonth() + 1) + "-" + isZero(d.getDate()) + " " + isZero(d.getHours()) + ":" + isZero(d.getMinutes()) + ":" + isZero(d.getSeconds());
            }            
        }
        
        window.onload = function()
        {
            Storage.writeData();//当打开页面的时候，先将localStorage中的数据输出一边，如果没有数据，则输出空
            document.getElementById("postBt").onclick = function(){Storage.saveData();}//发表评论按钮添加点击事件，作用是将localStorage中的数据输出
            document.getElementById("clearBt").onclick = function(){Storage.clearData();}//清空所有已保存的数据
        }
 </script>
 <script type="text/javascript">
 	$(document).ready(function(){
            $('#banners').bannerize({
                shuffle: 1,
                interval: "5"
            });
            $(".ui-line").hover(function(){
                $(this).addClass("ui-line-hover");
                $(this).find(".ui-bnnerp").addClass("ui-bnnerp-hover");
            },function(){
                $(this).removeClass("ui-line-hover");
                $(this).find(".ui-bnnerp").removeClass("ui-bnnerp-hover");
            });
        });
 </script>
    </head>
  <body>
   <div style="float: center;">
   	<iframe frameborder="0" src="<c:url value='/jsps/code.jsp'/>" name="body" scrolling="no" width="970px" height="210px"></iframe>
   	
   </div>
    <div class="warrper">

       <!--content-->
       <div class="content">
           <!--企业动态-->
           <div class="index-new">
               <div class="indexadd">
                   <div id="banners" class="ui-banner">
                       <ul class="ui-banner-slides">
                           <li><a href="#"><img src="../images/guanggao/ps(big).jpg" alt="学习ps"/></a></li>
                             <li><a href="#"><img src="../images/guanggao/math(big).jpg" alt="学习ps"/></a></li>
                               <li><a href="#"><img src="../images/guanggao/windows(big).jpg" alt="学习ps"/></a></li>
                                 <li><a href="#"><img src="../images/guanggao/office(big).jpg" alt="学习ps"/></a></li>
                                   <li><a href="#"><img src="../images/guanggao/wx(big).jpg" alt="学习ps"/></a></li>
                                   
                             
                             
                               </ul>
                               
                       <ul class="ui-banner-slogans">
                           <li class="ui-line">
                               <div class="ullinehover">
                                   <div class="ui-bnnerimg floatLeft">
                                       <img src="../images/guanggao/ps(small).jpg" alt="#" width="103"/>
                                   </div>
                                   <div class="ui-bnnerp floatRight">
                                       <h3 style="margin-top: 8px;">ps基础教程降价啦</h3>
                                       <p>悦购书城正式运营，为感谢广大朋友的支持和理解 </p>
                                       <p>凡在此书店购买本书的用户尽可享受五折优惠</p>
                                      
                                   </div>
                               </div>
                           </li>
                            <li class="ui-line">
                               <div class="ullinehover">
                                   <div class="ui-bnnerimg floatLeft">
                                       <img src="../images/guanggao/math(small).jpg" alt="" width="103"/>
                                   </div>
                                   <div class="ui-bnnerp floatRight">
                                       <h3 style="margin-top: 8px;">数学分析强势来袭</h3>
                                       <p>锻炼你的思维能力和逻辑判断能力的最好选择</p>
                                    <p>凡在此书店购买本书的用户尽可享受五折优惠</p>
                                   </div>
                               </div>
                           </li>
                          
                            <li class="ui-line">
                               <div class="ullinehover">
                                   <div class="ui-bnnerimg floatLeft">
                                       <img src="../images/guanggao/windows(small).jpg" alt="#" width="103"/>
                                   </div>
                                   <div class="ui-bnnerp floatRight">
                                       <h3 style="margin-top: 8px;">windows操作系统</h3>
                                        <p>熟悉windows操作系统的最佳选择</p>
                                    <p>凡在此书店购买本书的用户尽可享受五折优惠</p>
                                   </div>
                               </div>
                           </li>
                          
                            <li class="ui-line">
                               <div class="ullinehover">
                                   <div class="ui-bnnerimg floatLeft">
                                       <img src="../images/guanggao/office(small).jpg" alt="#" width="103"/>
                                   </div>
                                   <div class="ui-bnnerp floatRight">
                                       <h3 style="margin-top: 8px;">office办公</h3>
                                       <p>熟悉掌握office办公工具，让你在工作中更加轻松</br>
                                       </p>
 									  <p>
                                       凡在此书店购买本书的用户尽可享受五折优惠
                                       </p>
                                   </div>
                               </div>
                           </li>
                          
                            <li class="ui-line">
                               <div class="ullinehover">
                                   <div class="ui-bnnerimg floatLeft">
                                       <img src="../images/guanggao/wx(small).jpg" alt="#" width="103"/>
                                   </div>
                                   <div class="ui-bnnerp floatRight">
                                       <h3 style="margin-top: 8px;">寻找最美的旅游</h3>
                                       <p>带你走进作者的韩国之旅，体验别国的文化习俗</br> </p>
                                       <p>
                                       凡在此书店购买本书的用户尽可享受五折优惠
                                       </p>
                                   </div>
                               </div>
                           </li>
                          
                         
                          
                          
                       </ul>
                       <!--ui-banner-slogans end-->
                   </div>
               </div>
           </div>
           <!--企业动态 end-->
       </div>
       <!--content end-->

</div>
   </div>
 <!--  <div >
 设置首页的下端图片 -->
  <!--  <img src="../images/bodyimg.jpg" style="width: 970px;"></img> -->
   <!-- <div class="notes" id="notes"></div>
           <div id="content">
            <div id="post">
                <textarea class="transition"></textarea > <input id = "postBt"type = "button"value = "发表评论" / ><input id = "clearBt"type = "button"value = "清空所有已保存的数据" / ></div>
            <div id="comment"></div > </div>
   </div> -->
   
  </body>
</html>
