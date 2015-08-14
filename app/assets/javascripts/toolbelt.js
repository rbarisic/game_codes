// under-the-hood
function delete_cookie( name ) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

// Visual Functions

// Admin-related

function showAdminNotification() {
	var notif = $('#notification-admin');
	var btn = $('.pure-notification-ribbon');
	notif.removeClass('pure-notification-collapsed');
	btn.addClass('hidden');
	// Add Cookie
	document.cookie = 'adminWarning = false'
}

function hideAdminNotification() {
	var notif = $('#notification-admin');
	var btn = $('.pure-notification-ribbon');
	notif.addClass('pure-notification-collapsed');
	btn.removeClass('hidden');
	// Remove Cookie
	delete_cookie('adminWarning');
}

$(document).on('ready page:load', function() {
	console.log('lol');
	
	var codeField = $('input#game_code_code');

	codeField.focus(function() {
		$('div.code-info').addClass('code-info-active')
	})

	codeField.on('input', function(event) {
		var charsLeft = codeField.attr('maxlength') - codeField.val().length;
		if( charsLeft >= 1 ) {
			$('div.code-info').text(( codeField.attr('maxlength') - codeField.val().length ) + " characters left");
			$('div.code-info').removeClass('text-success');
		}
		else {
			$('div.code-info').text('code is valid ✓');
			$('div.code-info').addClass('text-success');
		}
	});

})
