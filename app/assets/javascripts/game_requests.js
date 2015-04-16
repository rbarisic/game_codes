// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
	/* Convenience for forms or links that return HTML from a remote ajax call.
	The returned markup will be inserted into the element id specified.
	*/
	$('form[data-update-target]').on('ajax:success', "m", function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});
}); 