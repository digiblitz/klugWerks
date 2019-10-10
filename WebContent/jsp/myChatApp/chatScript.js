#-------------------------------------------------------------------------------
# * Copyright: 2018 digiBlitz Foundation
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
//
//Copyright: 2018 digiBlitz Foundation
//
//License: digiBlitz Public License 1.0 (DPL) 
//Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
//
//Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
//
//Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
//
//"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
//
$(document).ready(function(){


$(".close").click(function(){
	
    $(".msg_box").hide();
});

$(".user").click(function(){
	
	
   $('.msg_box').show();
});

$(".arrow_down").click(function(){
	
    $(".msg_slideDown").slideToggle('slow');
	$(".arrow_up").show();
	$(".arrow_down").hide();
});

$(".arrow_up").click(function(){
	
    $(".msg_slideDown").slideToggle('slow');
	$(".arrow_up").hide();
	$(".arrow_down").show();
});

/*$('textarea').keypress(
    function(e){
        if (e.keyCode == 13) {
            var msg = $(this).val();
			$(this).val('');
			$("<div class='msg_b'>"+msg+"</div>").insertBefore('.msg_insert');
			$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
			
			//alert(msg);
			sendResponse(msg);
			sendResquest(msg);
			
        }
    });*/

		function sendRequest(msg) {
			var message = msg;
		        
			$.get('login.html?cmd=storeChatMessages&qOra=Question', {
		    	message : message        	      	
		    }, function(response) {			
		    	       
		    });		
		}
		

	function sendResponse(msg) {
		var sendMsg = msg;
        //alert('sending response '+msg);
		//var urll = 'http://www.digiblitzonline2.com:8983/solr/exampledocs/select?indent=on&q=*'+msg+'*&wt=json';
		//window.location.assign(url);
	
	//using xml call	
	/*	//var parm1 = document.getElementById('q').value;
		var params = {q: sendMsg}
        $.ajax({
            type: "GET",
            url: "http://www.digiblitzonline2.com:8983/solr/exampledocs/select?indent=on&wt=xml",
			data: params,
            dataType: "xml",
            success: function(xml){
                $(xml).find('doc').each(function(){
                var sTitle = $(this).find('str').text();
                var sPublisher = $(this).find('arr').text();
                $("<div class='msg_a'>"+sTitle+", "+sPublisher+"</div>").insertBefore('.msg_insert');
				$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
            });
            },
            error: function() {
            alert("An error occurred while processing XML file.");
            }
        });
		*/
		
		//using json call
		 $.getJSON("http://www.digiblitzonline2.com:8983/solr/exampledocs/select?indent=on&q="+sendMsg+"&wt=json&json.wrf=?", function(result){
			var Parent = document.getElementById('rs');
			for (var i = 0; i < result.response.docs.length; i++) {
			var thisResult = "<b>"+(i+1)+". "+ result.response.docs[i].question + "</b><br>" + result.response.docs[i].answer;
			//alert(thisResult);
			/*var thisResult = "<b>Sno - "+(i+1)+" "+ result.response.docs[i].question + "</b><br>" + result.response.docs[i].answer
			  + ", " + result.response.docs[i].cat + "<br>";*/
			  //var NewDiv = document.createElement("DIV");
			  //NewDiv.innerHTML = thisResult;
			  //Parent.appendChild(NewDiv);
			  
			/*Removed double quoutes*/
			/*
			var thisResult = "<b>Sno - "+i+" "+ JSON.stringify(result.response.docs[i])+ "</b><br>";
			thisResult = thisResult.replace(/"/g, "");
			thisResult = thisResult.replace(/[{}]/g, "");
			thisResult = thisResult.replace(/[[]]/g, "");
			thisResult = thisResult.replace(/[\[\]']+/g,'')
			
			/**/
			
			$("<div class='msg_a'><div class='other'><div class='avatar'><img src='images/Lavlita-AI_verysmall.jpg' draggable=false'/></div><div class='msg'><p>"+thisResult+"</p></div>").insertBefore('.msg_insert');
			$('.popup-messages').scrollTop($('.popup-messages')[0].scrollHeight);
			}
		});
		
    }
	
	function sendResponse1(msg) {
		var message = msg;
		
		$.get('login.html?cmd=storeChatMessages&qOra=Answer', {
        	message : message        	     	
        }, function(response) {			
        	       
        });		
    }

	
	
});


