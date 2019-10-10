#-------------------------------------------------------------------------------
# * Copyright: 2019 digiBlitz Foundation
#  * 
#  * License: digiBlitz Public License 1.0 (DPL) 
#  * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
#  * 
#  * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
#  * 
#  * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
#  * 
#  * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
#-------------------------------------------------------------------------------
<!---
Copyright: 2019 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
     <head>
     <title>Home</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />

     <link rel="stylesheet" href="css/Style1.css">
  <script src="js/jquery.js"></script>       
     <script src="js/script.js"></script>      
     <script src="js/superfish.js"></script>
     

   <script>
		function tab(ele)
		{
			$(".pricing").removeClass("active");
			$("#"+ele).addClass("active");
		}
	</script>
     </head>
<body id="top">

<!--==============================header=================================-->

<div>
    <%@ include file = "../../include/Header.jsp" %>
</div>

<div class="bg1">
 <div class="slider_wrapper">
        <div id="camera_wrap">
<!--=======slider================================-->

    <div style="text-align:left;font-family: Verdana, Arial, Helvetica, sans-serif; font-size:15px; font-weight:bold; margin-left:-10px; padding:10px;  margin-top:60px;  color:#666666;">
<div style=""><a id="btn_21"  href="#" class="btn color_3 text_3" style="background:none; border:none; padding:0; margin:0;color:#6699FF;font-size:22px">Beta</a></div>
</div>
<div class="pricing_table_wdg">
		<ul class="pricing" id="one" onMouseOver="tab('one')">
			<li style="background:#01bf9d;">Basic</li>
			<li>$99/<span style="font-size:12px;">month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">-</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_1" style="background:none; border:none; padding:0; margin:0;">Membership and Subscription</a></li>
			<li><a id="btn_2" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a id="btn_3" style="background:none; border:none; padding:0; margin:0;">Business Intelligence</a></li>
			<li><a id="btn_4" style="background:none; border:none; padding:0; margin:0;">Business Architecture Management</a></li>
			<li><a id="btn_5" style="background:none; border:none; padding:0; margin:0;">Product Training and Support</a></li>
			
			<li style="border:none"><a style="width:40%; float:left; margin:10px;background:#01bf9d;" href="signUp.html?signUpProcess=pricingDetails" class="buy_now">Try Now</a><a style="width:40%; float:left; margin:10px;" href="signUp.html?signUpProcess=pricingDetails&getProductPrice=99&productPlan=Basic" class="buy_now">Buy Now</a></li>
			<!--<li><a href="" class="buy_now">Buy Now</a></li>-->
		</ul>
		
		<ul class="pricing active" id="two" onMouseOver="tab('two')">
			<li style="background:coral;">Silver</li>
			<li>$299/<span style="font-size:12px;">month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_6" style="background:none; border:none; padding:0; margin:0;">Membership and Subscription</a></li>
			<li><a id="btn_7" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a id="btn_8" style="background:none; border:none; padding:0; margin:0;">Business Intelligence</a></li>
			<li><a id="btn_9" style="background:none; border:none; padding:0; margin:0;">Business Architecture Management</a></li>
			<li><a id="btn_10" style="background:none; border:none; padding:0; margin:0;">Product Training and Support</a></li>
			<li style="border:none"><a style="width:50%; float:left; margin:10px 50px;" href="signUp.html?signUpProcess=pricingDetails&getProductPrice=299&productPlan=Silver" class="buy_now">Buy Now</a></li>
		</ul>
		
		<ul class="pricing" id="three" onMouseOver="tab('three')">
			<li style="background:goldenrod;">Gold</li>
			<li>$1249/<span style="font-size:12px;">month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$3999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a  id="btn_11" style="background:none; border:none; padding:0; margin:0;">Membership and Subscription</a></li>
			<li><a  id="btn_12" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a  id="btn_13" style="background:none; border:none; padding:0; margin:0;">Business Intelligence</a></li>
			<li><a  id="btn_14" style="background:none; border:none; padding:0; margin:0;">Business Architecture Management</a></li>
			<li><a  id="btn_15" style="background:none; border:none; padding:0; margin:0;">Product Training and Support</a></li>
			<li style="border:none"><a style="width:50%; float:left; margin:10px 50px;" href="signUp.html?signUpProcess=pricingDetails&getProductPrice=1429&productPlan=Gold" class="buy_now">Buy Now</a></li>
		</ul>
		
		<ul class="pricing" id="four" onMouseOver="tab('four')">
			<li style="background:palevioletred;">Platinum</li>
			<li>$4999/<span style="font-size:12px;">month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$14999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_16" style="background:none; border:none; padding:0; margin:0;">Membership and Subscription</a></li>
			<li><a id="btn_17" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a id="btn_18" style="background:none; border:none; padding:0; margin:0;">Business Intelligence</a></li>
			<li><a id="btn_19" style="background:none; border:none; padding:0; margin:0;">Business Architecture Management</a></li>
			<li><a id="btn_20" style="background:none; border:none; padding:0; margin:0;">Product Training and Support</a></li>
			<li style="border:none"><a style="width:50%; float:left; margin:10px 50px;" href="signUp.html?signUpProcess=pricingDetails&getProductPrice=4999&productPlan=Platinum" class="buy_now">Buy Now</a></li>
		</ul>
		
		<ul class="pricing" id="five" onMouseOver="tab('five')">
			<li style="background:#334960;">Enterprise</li>
			<li style="height:45px"><span style="font-size:12px;"></span></li>
			
			<li style="border-bottom:none; font-weight:bold; color:white; background-color:#000000;height:55px;padding-top:18px">
			<span style="vertical-align:middle">Call For Pricing</span></li>
			
		<!--	<li>$120</li>
			<li>Perfect for those getting started with our app.</li>
			<li>15 Projects</li>
			<li>5GB Storage</li>
			<li>Unlimited Users</li>
			<li>No Time Tracking</li>
			<li>Enchaned Security</li>
			<li></li>-->
			<!--li><a style="width:30%; float:left; margin:10px;background:#334960;" href="" class="buy_now">Try</a><a style="width:30%; float:left; margin:10px;" href="" class="buy_now">Buy</a></li-->
		</ul>
		
	
</div>

	
	 
<div style="clear:both;">

<script src="js/popup_view.js"></script>
<script>
var popupView = new popup();

document.querySelector('#btn_1').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_1'));
});

document.querySelector('#btn_2').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_2'), function () {
        console.log('show do something');
    });
});

document.querySelector('#btn_3').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_3'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_4').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_4'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_5').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_5'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_6').addEventListener('click', function () {
	popupView.show(document.querySelector('#popup_6'));
});

document.querySelector('#btn_7').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_7'), function () {
        console.log('show do something');
    });
});

document.querySelector('#btn_8').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_8'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_9').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_9'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_10').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_10'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_11').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_11'));
});

document.querySelector('#btn_12').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_12'), function () {
        console.log('show do something');
    });
});

document.querySelector('#btn_13').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_13'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_14').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_14'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_15').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_15'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_16').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_16'));
});

document.querySelector('#btn_17').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_17'), function () {
        console.log('show do something');
    });
});

document.querySelector('#btn_18').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_18'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_19').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_19'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_20').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_20'), '', function () {
        console.log('CLOSE');
    });
});
document.querySelector('#btn_21').addEventListener('click', function () {
    popupView.show(document.querySelector('#popup_21'), function () {
        console.log('CLOSE');
    });
});
</script>
	
	
</div>
		 <div id="popup_1" class="pop_up popup_hide">
        <h1>Membership and Subscription</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User</h5>
                <div class="head">
                <p>Organizer User <span>1</span></p>
                <p>Member User <span>25</span></p>
                <p>Sub Chapter User <span>1</span></p>
                <p>Corporate User <span>1</span></p>
                <p>Business Head User <span>1</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>Events Management</h5>
                <div class="head">
                <p>No. of Events <span>1</span></p>
                <p>No. of Events Entries <span>50</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Training Management</h5>
               <div class="head">
                <p>Interactive Assignment / Lab <span>1</span></p>
                <p>Descriptive Assignment / Lab <span>5</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>5</span></p>
                <p>No. of Elaborative / Descriptive Tests <span>1</span></p>
             
                </div>
            </div>
             <div class="member1">
                <h5>Membership Management</h5>
                <div class="head"  style="height:60px;">
                <p style="text-align:center;">Included</p>
              
                </div>
            </div>
             <div class="member1">
                <h5>Subchapter</h5>
                <div class="head" style="height:60px;">
                <p style="text-align:center;">-</p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Web Store</h5>
               <div class="head" style="height:60px;">
                <p style="text-align:center;">Include</p>
               
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_2" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP</h5>
                <div class="head">
                <p>No. of Modules <span>2</span></p>
                <p>No. of Forms <span>10</span></p>
                <p>No. of Screens <span>40</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>2</span></p>
                <p>No. of Consumer Services <span>6</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>1</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>2</span></p>
                <p>No. of Multi-Instance Process <span>1</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>1</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_3" class="pop_up popup_hide">
        <h1>Business Intelligence</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>-</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>1</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_4" class="pop_up popup_hide">
        <h1>Business Architecture Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management & <br>Governance</h5>
                <div class="head">
                <p>No of un-governed Assets/Artifacts <span>100</span></p>
                <p>No of Governed Assets/Artifacts <span>-</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No of BA LifeCycle Design Allowed <span>-</span></p>
                <p>No of Business Mapping Allowed <span>-</span></p>
                <p>No of Business of Process Units aligned <span>-</span></p>
                <p>No of Business Reference Architecture <span>-</span></p>
                <p>No of Blue Prints <span>-</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No of EA frameworks <span>-</span></p>
                <p>No of EA LifeCycle Design Allowed <span>-</span></p>
                <p>No of Technical Reference Architecture <span>-</span></p>
                <p>No of Business Processes Alignment <span>-</span></p>
                <p>No of Business Services Alignment <span>-</span></p>
                <p>No of Web/technical Services Alignment <span>-</span></p>
                <p>No of Application component Alignment <span>-</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_5" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support & Training</h5>
                <div class="head">
                <p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support - Telephone, Chat, <br>Remote Login & WebEx <span>-</span></p>
                <p>Training & Technical Support - Onsite <span>-</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support - Telephone, Chat, Remote Login & WebEx <span>-</span></p>
                <p>BET Support - Onsite <span>-</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>-</p>
               
                
                </div>
            </div>
            <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>-</p>
               
                
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
        </div>
		
<!-- --------------silver----------------------- -->	
 <div id="popup_6" class="pop_up popup_hide">
        <h1>Membership and Subscription</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User</h5>
                <div class="head">
                <p>Organizer User <span>1</span></p>
                <p>Member User <span>25</span></p>
                <p>Sub Chapter User <span>1</span></p>
                <p>Corporate User <span>1</span></p>
                <p>Business Head User <span>1</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>Events Management</h5>
                <div class="head">
                <p>No. of Events <span>1</span></p>
                <p>No. of Events Entries <span>50</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Training Management</h5>
               <div class="head">
                <p>Interactive Assignment / Lab <span>1</span></p>
                <p>Descriptive Assignment / Lab <span>5</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>5</span></p>
                <p>No. of Elaborative / Descriptive Tests <span>1</span></p>
             
               </div>
            </div>
             <div class="member1">
                <h5>Membership Management</h5>
                <div class="head"  style="height:60px;">
                <p style="text-align:center;">Included</p>
              
                </div>
            </div>
             <div class="member1">
                <h5>Subchapter</h5>
                <div class="head" style="height:60px;">
                <p style="text-align:center;">-</p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Web Store</h5>
               <div class="head" style="height:60px;">
                <p style="text-align:center;">Include</p>
               
               </div>
            </div>
        </div>
   </div>
        <div class="pop_up_close"></div>
       
</div>
		
<!--functional process.-->
    
    <div id="popup_7" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP</h5>
                <div class="head">
                <p>No. of Modules <span>2</span></p>
                <p>No. of Forms <span>10</span></p>
                <p>No. of Screens <span>40</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>30</span></p>
                <p>No. of Consumer Services <span>100</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>2</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>15</span></p>
                <p>No. of Multi-Instance Process <span>5</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>2</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_8" class="pop_up popup_hide">
        <h1>Business Intelligence</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>1</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>5</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_9" class="pop_up popup_hide">
        <h1>Business Architecture Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management & <br>Governance</h5>
                <div class="head">
                <p>No of un-governed Assets/Artifacts <span>500</span></p>
                <p>No of Governed Assets/Artifacts <span>50</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No of BA LifeCycle Design Allowed <span>1</span></p>
                <p>No of Business Mapping Allowed <span>4</span></p>
                <p>No of Business of Process Units aligned <span>1</span></p>
                <p>No of Business Reference Architecture <span>1</span></p>
                <p>No of Blue Prints <span>1</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No of EA frameworks <span>1</span></p>
                <p>No of EA LifeCycle Design Allowed <span>1</span></p>
                <p>No of Technical Reference Architecture <span>1</span></p>
                <p>No of Business Processes Alignment <span>1</span></p>
                <p>No of Business Services Alignment <span>5</span></p>
                <p>No of Web/technical Services Alignment <span>20</span></p>
                <p>No of Application component Alignment <span>100</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_10" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support & Training</h5>
                <div class="head">
                <p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support - Telephone, Chat, <br>Remote Login & WebEx <span>One Remote Training & Support Bundle Included
                </span></p>
                <p>Training & Technical Support - Onsite <span>Call For Pricing
                </span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support - Telephone, Chat, Remote Login & WebEx <span>-</span></p>
                <p>BET Support - Onsite <span>Call For Pricing
                </span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>Call For Pricing
                </p>
               
                
                </div>
            </div>
            <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>Call For Pricing
                </p>
               
                
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
        </div>
<!-- silver end -->
        
        
        
        
        <!-- ---------------- gold --------------------- -->	
        
         <div id="popup_11" class="pop_up popup_hide">
        <h1>Membership and Subscription</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User</h5>
                <div class="head">
                <p>Organizer User <span>3</span></p>
                <p>Member User <span>75</span></p>
                <p>Sub Chapter User <span>3</span></p>
                <p>Corporate User <span>3</span></p>
                <p>Business Head User <span>3</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>Events Management</h5>
                <div class="head">
                <p>No. of Events <span>5</span></p>
                <p>No. of Events Entries <span>250</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Training Management</h5>
               <div class="head">
                <p>Interactive Assignment / Lab <span>5</span></p>
                <p>Descriptive Assignment / Lab <span>25</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>25</span></p>
                <p>No. of Elaborative / Descriptive Tests <span>5</span></p>
             
                </div>
            </div>
             <div class="member1">
                <h5>Membership Management</h5>
                <div class="head"  style="height:60px;">
                <p style="text-align:center;">Included</p>
              
                </div>
            </div>
             <div class="member1">
                <h5>Subchapter</h5>
                <div class="head" style="height:60px;">
                <p style="text-align:center;">Two respective subchapter bundle included
                </p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Web Store</h5>
               <div class="head" style="height:60px;">
                <p style="text-align:center;">Include</p>
               
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_12" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP</h5>
                <div class="head">
                <p>No. of Modules <span>10</span></p>
                <p>No. of Forms <span>50</span></p>
                <p>No. of Screens <span>200</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>2</span></p>
                <p>No. of Consumer Services <span>6</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>1</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>2</span></p>
                <p>No. of Multi-Instance Process <span>1</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>1</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_13" class="pop_up popup_hide">
        <h1>Business Intelligence</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>1</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>5</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_14" class="pop_up popup_hide">
        <h1>Business Architecture Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management & <br>Governance</h5>
                <div class="head">
                <p>No of un-governed Assets/Artifacts <span>500</span></p>
                <p>No of Governed Assets/Artifacts <span>50</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No of BA LifeCycle Design Allowed <span>5</span></p>
                <p>No of Business Mapping Allowed <span>20</span></p>
                <p>No of Business of Process Units aligned <span>5</span></p>
                <p>No of Business Reference Architecture <span>3</span></p>
                <p>No of Blue Prints <span>5</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No of EA frameworks <span>2</span></p>
                <p>No of EA LifeCycle Design Allowed <span>5</span></p>
                <p>No of Technical Reference Architecture <span>5</span></p>
                <p>No of Business Processes Alignment <span>5</span></p>
                <p>No of Business Services Alignment <span>25</span></p>
                <p>No of Web/technical Services Alignment <span>100</span></p>
                <p>No of Application component Alignment <span>500</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_15" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support & Training</h5>
                <div class="head">
                <p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support - Telephone, Chat, <br>Remote Login & WebEx <span>Three Remote Training & Support Bundle Included
                </span></p>
                <p>Training & Technical Support - Onsite <span>Call For Pricing
                </span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support - Telephone, Chat, Remote Login & WebEx <span>-</span></p>
                <p>BET Support - Onsite <span>Call For Pricing
                </span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>Call For Pricing
                </p>
               
                
                </div>
            </div>
            <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>Call For Pricing
                </p>
               
                
                </div>
            </div>
        </div>
         </div>
         
        <div class="pop_up_close"></div>
        </div>
        
        <!-- end gold -->
        
        <!------------------ platinum ------------------>
         <div id="popup_16" class="pop_up popup_hide">
        <h1>Membership and Subscription</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User</h5>
                <div class="head">
                <p>Organizer User <span>15</span></p>
                <p>Member User <span>375</span></p>
                <p>Sub Chapter User <span>15</span></p>
                <p>Corporate User <span>15</span></p>
                <p>Business Head User <span>15</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>Events Management</h5>
                <div class="head">
                <p>No. of Events <span>20</span></p>
                <p>No. of Events Entries <span>1000</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Training Management</h5>
               <div class="head">
                <p>Interactive Assignment / Lab <span>25</span></p>
                <p>Descriptive Assignment / Lab <span>125</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>125</span></p>
                <p>No. of Elaborative / Descriptive Tests <span>25</span></p>
             
                </div>
            </div>
             <div class="member1">
                <h5>Membership Management</h5>
                <div class="head"  style="height:60px;">
                <p style="text-align:center;">Included</p>
              
                </div>
            </div>
             <div class="member1">
                <h5>Subchapter</h5>
                <div class="head" style="height:60px;">
                <p style="text-align:center;">Five respective subchapter bundle included
                </p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Web Store</h5>
               <div class="head" style="height:60px;">
                <p style="text-align:center;">Include</p>
               
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_17" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP</h5>
                <div class="head">
                <p>No. of Modules <span>30</span></p>
                <p>No. of Forms <span>150</span></p>
                <p>No. of Screens <span>600</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>10</span></p>
                <p>No. of Consumer Services <span>30</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>5</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>10</span></p>
                <p>No. of Multi-Instance Process <span>5</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>5</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_18" class="pop_up popup_hide">
        <h1>Business Intelligence</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>5</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>25</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_19" class="pop_up popup_hide">
        <h1>Business Architecture Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management & <br>Governance</h5>
                <div class="head">
                <p>No of un-governed Assets/Artifacts <span>2500</span></p>
                <p>No of Governed Assets/Artifacts <span>250</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No of BA LifeCycle Design Allowed <span>25</span></p>
                <p>No of Business Mapping Allowed <span>100</span></p>
                <p>No of Business of Process Units aligned <span>25</span></p>
                <p>No of Business Reference Architecture <span>15</span></p>
                <p>No of Blue Prints <span>25</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No of EA frameworks <span>10</span></p>
                <p>No of EA LifeCycle Design Allowed <span>25</span></p>
                <p>No of Technical Reference Architecture <span>25</span></p>
                <p>No of Business Processes Alignment <span>25</span></p>
                <p>No of Business Services Alignment <span>125</span></p>
                <p>No of Web/technical Services Alignment <span>500</span></p>
                <p>No of Application component Alignment <span>2500</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_20" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support & Training</h5>
                <div class="head">
                <p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support - Telephone, Chat, <br>Remote Login & WebEx <span>Seven Remote Training & Support Bundle Included
                </span></p>
                <p>Training & Technical Support - Onsite <span>Call For Pricing
                </span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support - Telephone, Chat, Remote Login & WebEx <span>One Remote BET Support Bundle Included
                </span></p>
                <p>BET Support - Onsite <span>Call For Pricing
                </span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>Call For Pricing
                </p>
               
                
                </div>
            </div>
            <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>Call For Pricing
                </p>
               
                
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
        </div>
		
		
		<div id="popup_21" class="pop_up popup_hide">
       	 <p style="color: #fff; font-size: 18px;line-height: 36px; text-align: justify; padding-right: 40px;">It is an evolution from the previous version in terms of Fixing Bugs, Countering Errors, Improved Ease of Access and User Interface. We have added features that makes the user maximise his productivity to a greater scale.</p>
		 <div class="pop_up_close"></div>
		</div>
		
		
		<div style="text-align:left;font-family: Verdana, Arial, Helvetica, sans-serif; font-size:20px; margin-left:-10px; padding:10px; margin-top:10px; margin-bottom:40px; color:#666666;">Basic packages starts with 30 days trial</div>	
</div>
</div>
</div>


<!--=======footer=================================-->

 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
