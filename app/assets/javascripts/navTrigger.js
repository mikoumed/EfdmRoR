$(document).ready(function() {
	$('.nav-trigger').click(function(e) {
		console.log('js working');
		 e.preventDefault();
		$('.side-nav').toggleClass('visible');

	});
});
