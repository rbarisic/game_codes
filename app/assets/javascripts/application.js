// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
	/* Convenience for forms or links that return HTML from a remote ajax call.
	The returned markup will be inserted into the element id specified.
	*/
	$('form[data-update-target]').live('ajax:success', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});
}); 