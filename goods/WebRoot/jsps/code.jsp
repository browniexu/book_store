<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>图片幻灯切换</title>
        <style type="text/css">
             * {
                margin: 0;
                padding: 0;
            }
            
            body {
                background: #FFF;
                color: #333;
                font: 12px / 1.6em Helvetica, Arial, sans-serif;
            }
            
            h1, h2, h3, h4, h5, h6 {
                font-size: 1em;
            }
            
            a {
                color: #0287CA;
                text-decoration: none;
            }
            
            a:hover {
                text-decoration: underline;
            }
            
            ul, li {
                list-style: none;
            }
            
            fieldset, img {
                border: none;
            }
            
            legend {
                display: none;
            }
            
            em, strong, cite, th {
                font-style: normal;
                font-weight: normal;
            }
            
            input, textarea, select, button {
                font: 12px Helvetica, Arial, sans-serif;
            }
            
            table {
                border-collapse: collapse;
            }
            
            html {
                overflow: -moz-scrollbars-vertical;
            } #ibanner {
                position: relative;
                width: 770px;
                height: 190px;
                overflow: hidden;
                margin-left:100px;
				margin-bottom:30px;
            } #ibanner_pic {
            } #ibanner_pic a {
                position: absolute;
                top: 0;
                display: block;
                width: 770px;
                height: 250px;
                overflow: hidden;
            } #ibanner_btn {
                position: absolute;
                z-index: 9999;
                right: 5px;
                bottom: 5px;
                font-weight: 700;
                font-family: Arial;
            } #ibanner_btn span {
                display: block;
                float: left;
                margin-left: 4px;
                padding: 0 5px;
                background: #000;
                cursor: pointer;
            } #ibanner_btn .normal {
                height: 20px;
                margin-top: 8px;
                border: 1px solid #999;
                color: #999;
                font-size: 16px;
                line-height: 20px;
            } #ibanner_btn .current {
                height: 28px;
                border: 1px solid #FF5300;
                color: #FF5300;
                font-size: 28px;
                line-height: 28px;
            }
        </style>
        <script type="text/javascript">
            function $(id){
                return document.getElementById(id);
            }
            
            function addLoadEvent(func){
                var oldonload = window.onload;
                if (typeof window.onload != 'function') {
                    window.onload = func;
                }
                else {
                    window.onload = function(){
                        oldonload();
                        func();
                    }
                }
            }
            
            function addBtn(){
                if (!$('ibanner') || !$('ibanner_pic')) 
                    return;
                var picList = $('ibanner_pic').getElementsByTagName('a');
                if (picList.length == 0) 
                    return;
                var btnBox = document.createElement('div');
                btnBox.setAttribute('id', 'ibanner_btn');
                var SpanBox = '';
                for (var i = 1; i <= picList.length; i++) {
                    var spanList = '<span class="normal">' + i + '</span>';
                    SpanBox += spanList;
                }
                btnBox.innerHTML = SpanBox;
                $('ibanner').appendChild(btnBox);
                $('ibanner_btn').getElementsByTagName('span')[0].className = 'current';
                for (var m = 0; m < picList.length; m++) {
                    var attributeValue = 'picLi_' + m
                    picList[m].setAttribute('id', attributeValue);
                }
            }
            
            function moveElement(elementID, final_x, final_y, interval){
                if (!document.getElementById) 
                    return false;
                if (!document.getElementById(elementID)) 
                    return false;
                var elem = document.getElementById(elementID);
                if (elem.movement) {
                    clearTimeout(elem.movement);
                }
                if (!elem.style.left) {
                    elem.style.left = "0px";
                }
                if (!elem.style.top) {
                    elem.style.top = "0px";
                }
                var xpos = parseInt(elem.style.left);
                var ypos = parseInt(elem.style.top);
                if (xpos == final_x && ypos == final_y) {
                    moveing = false;
                    return true;
                }
                if (xpos < final_x) {
                    var dist = Math.ceil((final_x - xpos) / 10);
                    xpos = xpos + dist;
                }
                if (xpos > final_x) {
                    var dist = Math.ceil((xpos - final_x) / 10);
                    xpos = xpos - dist;
                }
                if (ypos < final_y) {
                    var dist = Math.ceil((final_y - ypos) / 10);
                    ypos = ypos + dist;
                }
                if (ypos > final_y) {
                    var dist = Math.ceil((ypos - final_y) / 10);
                    ypos = ypos - dist;
                }
                elem.style.left = xpos + "px";
                elem.style.top = ypos + "px";
                var repeat = "moveElement('" + elementID + "'," + final_x + "," + final_y + "," + interval + ")";
                elem.movement = setTimeout(repeat, interval);
            }
            
            function classNormal(){
                var btnList = $('ibanner_btn').getElementsByTagName('span');
                for (var i = 0; i < btnList.length; i++) {
                    btnList[i].className = 'normal';
                }
            }
            
            function picZ(){
                var picList = $('ibanner_pic').getElementsByTagName('a');
                for (var i = 0; i < picList.length; i++) {
                    picList[i].style.zIndex = '1';
                }
            }
            
            var autoKey = false;
            function iBanner(){
                if (!$('ibanner') || !$('ibanner_pic') || !$('ibanner_btn')) 
                    return;
                $('ibanner').onmouseover = function(){
                    autoKey = true
                };
                $('ibanner').onmouseout = function(){
                    autoKey = false
                };
                
                var btnList = $('ibanner_btn').getElementsByTagName('span');
                var picList = $('ibanner_pic').getElementsByTagName('a');
                if (picList.length == 1) 
                    return;
                picList[0].style.zIndex = '2';
                for (var m = 0; m < btnList.length; m++) {
                    btnList[m].onmouseover = function(){
                        for (var n = 0; n < btnList.length; n++) {
                            if (btnList[n].className == 'current') {
                                var currentNum = n;
                            }
                        }
                        classNormal();
                        picZ();
                        this.className = 'current';
                        picList[currentNum].style.zIndex = '2';
                        var z = this.childNodes[0].nodeValue - 1;
                        picList[z].style.zIndex = '3';
                        if (currentNum != z) {
                            picList[z].style.left = '770px';
                            moveElement('picLi_' + z, 0, 0, 10);
                        }
                    }
                }
            }
            
            setInterval('autoBanner()', 5000);
            function autoBanner(){
                if (!$('ibanner') || !$('ibanner_pic') || !$('ibanner_btn') || autoKey) 
                    return;
                var btnList = $('ibanner_btn').getElementsByTagName('span');
                var picList = $('ibanner_pic').getElementsByTagName('a');
                if (picList.length == 1) 
                    return;
                for (var i = 0; i < btnList.length; i++) {
                    if (btnList[i].className == 'current') {
                        var currentNum = i;
                    }
                }
                if (currentNum == (picList.length - 1)) {
                    classNormal();
                    picZ();
                    btnList[0].className = 'current';
                    picList[currentNum].style.zIndex = '2';
                    picList[0].style.zIndex = '3';
                    picList[0].style.left = '770px';
                    moveElement('picLi_0', 0, 0, 10);
                }
                else {
                    classNormal();
                    picZ();
                    var nextNum = currentNum + 1;
                    btnList[nextNum].className = 'current';
                    picList[currentNum].style.zIndex = '2';
                    picList[nextNum].style.zIndex = '3';
                    picList[nextNum].style.left = '770px';
                    moveElement('picLi_' + nextNum, 0, 0, 10);
                }
            }
            
            addLoadEvent(addBtn);
            addLoadEvent(iBanner);
        </script>
    </head>
    <body>
    <!--  <img src="../images/cebian.jpg" style="float: right;width:200px;"></img> -->
        <div id="ibanner" style="float: left;">
            <div id="ibanner_pic">
                <a href="#"><img src="../images/guanggao/guanggao1.jpg" alt="#" /></a>
                <a href="#"><img src="../images/guanggao/guanggao2.jpg" alt="#" /></a>
                <a href="#"><img src="../images/guanggao/guanggao3.jpg" alt="#" /></a>
                <a href="#"><img src="../images/guanggao/guanggao4.jpg" alt="#" /></a>
                 <a href="#"><img src="../images/guanggao/guanggao5.jpg" alt="#" /></a>
            </div>
        </div><!--ibanner end-->
       
    </body>
</html>