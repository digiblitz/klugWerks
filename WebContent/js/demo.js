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
$(document).ready(function() {
	function consoleWrite(message) {
		$('#console').focus().append(message + '\n');
	}

	$('#demo2').html($('#demo1').html());
	$('#demo1 li').first().addClass('active');
	$('#demo2 li').first().addClass('active');

	$('#demo1, #demo2').find("li > a").click(function(e) {
		e.preventDefault();
		var isLink = $(this).is("a");
		var href = isLink ? $(this).attr('href') : '';

		if (isLink && href !== '#') {
			consoleWrite('Click my caret to open my submenu');
		} else if (isLink) {
			consoleWrite('Dummy link');
		}
	});

	consoleWrite('navgoco console waiting for input...');

	$('pre > code').each(function() {
		var that = $(this),
			type = that.attr('class'),
			source = that.data('source'),
			code = $('#' + source + '-' + type).html();
		that.text($.trim(code));
	});

	$(".tabs a").click(function(e) {
		e.preventDefault();
		$(this).parent().siblings().removeClass('active').end().addClass('active');
		$(this).parents('ul').next().children().hide().eq($(this).parent().index()).show();
	});

	$(".panes").each(function() {
		$(this).children().hide().eq(0).show();

	});
	hljs.tabReplace = '    ';
	hljs.initHighlightingOnLoad();
});
