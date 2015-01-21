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