<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/camera.css"> 
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">
	 
<title>Insert title here</title>
<script type="text/javascript">
function toggle(div_id) {
    var el = document.getElementById(div_id);
    if ( el.style.display == 'none' ) { el.style.display = 'block';}
    else {el.style.display = 'none';}
}
function blanket_size(popUpDivVar) {
    if (typeof window.innerWidth != 'undefined') {
        viewportheight = window.innerHeight;
    } else {
        viewportheight = document.documentElement.clientHeight;
    }
    if ((viewportheight > document.body.parentNode.scrollHeight) && (viewportheight > document.body.parentNode.clientHeight)) {
        blanket_height = viewportheight;
    } else {
        if (document.body.parentNode.clientHeight > document.body.parentNode.scrollHeight) {
            blanket_height = document.body.parentNode.clientHeight;
        } else {
            blanket_height = document.body.parentNode.scrollHeight;
        }
    }
    var blanket = document.getElementById('blanket');
    blanket.style.height = blanket_height + 'px';
    var popUpDiv = document.getElementById(popUpDivVar);
    popUpDiv_height=blanket_height/2-200;//200 is half popup's height
    popUpDiv.style.top = popUpDiv_height + 'px';
}
function window_pos(popUpDivVar) {
    if (typeof window.innerWidth != 'undefined') {
        viewportwidth = window.innerHeight;
    } else {
        viewportwidth = document.documentElement.clientHeight;
    }
    if ((viewportwidth > document.body.parentNode.scrollWidth) && (viewportwidth > document.body.parentNode.clientWidth)) {
        window_width = viewportwidth;
    } else {
        if (document.body.parentNode.clientWidth > document.body.parentNode.scrollWidth) {
            window_width = document.body.parentNode.clientWidth;
        } else {
            window_width = document.body.parentNode.scrollWidth;
        }
    }
    var popUpDiv = document.getElementById(popUpDivVar);
    window_width=window_width/2-200;//200 is half popup's width
    popUpDiv.style.left = window_width + 'px';
}
function popup(windowname) {
    blanket_size(windowname);
    window_pos(windowname);
    toggle('blanket');
    toggle(windowname);     
}
</script>
<!--style>
#blanket {
   background-color:#111;
   opacity: 0.65;
   *background:none;
   position:absolute;
   z-index: 9001;
   top:0px;
   left:0px;
   width:100%;
}

#popUpDiv {
    position:absolute;
    background:url(pop-back.jpg) no-repeat;
    width:400px;
    height:400px;
    border:5px solid #000;
    z-index: 9002;
}

#popUpDiv { a position:relative; top:20px; left:20px}
</style-->
<style>
	.box1 {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}

.button {
  font-size: 1.5em!important;
     padding: 9px 8px 17px 8px;
  color: #fff;
  border: 2px solid #06D85F;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
  position:fixed;
  width:50px;
  height:15px;
  top:300px;
  transform:rotate(90deg);
  z-index:1000;
  right:-17px!important;
  background:#06d85f;
  font-family:'Open Sans', sans-serif!important;
  right:0;
  font-weight:bold;

}
.button:hover {
  border:2px solid #06D85F;
  color:#06D85F; 
  background:#fff;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
  z-index:999;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 250px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 26px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
a.hov {
    color: #fff;
}
a.hov:hover {
    color: red;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box1{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
</style>
</head>
<body>
<!--div id="blanket" style="display:none;" onClick="popup('popUpDiv')"></div>
    <div id="popUpDiv" style="display:none;background-color:#FFFFFF;color:#00FF00">

        <img src="images/cal_close.gif" alt="" onClick="popup('popUpDiv')" align="right"/>
		<div onClick="popup('popUpDiv')"></div>
    </div>  
   <div style="width: 70px;float: right;border-style: ridge;background-color: forestgreen;border-color: forestgreen;" align="center">
   	<a id="link" onClick="popup('popUpDiv')" href="#" style="color: white;font-weight: bold;font-family: sans-serif;width:100%;">Chat</a></div-->
    
	<div class="box1">
		<a class="button" href="#popup1">Chat</a>
	</div>
	
	<div id="popup1" class="overlay">
		<div class="popup" >
		<a href="#"><%@ include file = "../application.jsp" %></a>
			<a class="close" href="#">&times;</a>
			<div class="content">
				
			</div>
		</div>
	</div>
	
   <div id="stuck_container" style="text-align:center;"> 
        <div class="container_12">
            <div class="grid_12"><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
             <span id="copyright-year" style="color:#FFFFFF"></span>&nbsp;&copy;&nbsp;
            <a class="hov" href="http://www.digiblitz.com/">Powered by digiBlitz Technologies Pvt Ltd.</a>
    	
            </div>
        </div>
		
		
    </div>
	
	
	

</body>
</html>
