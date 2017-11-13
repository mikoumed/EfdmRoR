// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap
//= require turbolinks
//= require moment
//= require daterangepicker
//= require fullcalendar
//= require bootstrap-timepicker
//= require bootstrap-datetimepicker
//= require select2
//= require_tree .

$(document).on('turbolinks:load', function(){
	$("[role='datatable']").each(function(){
		$(this).DataTable({
				processing :true,
				serverSide :true,
        		// bJQueryUI :true,
				// columnDefs :[
				// 				{ className: "timeColumn", "targets": [ 0, 7, 8] }
				// 			],
				deferRender :true,
				ajax:$(this).data('url')
		})
	});
	$('.timepicker').timepicker();
	$('.select2').select2();
	$('#async_dataEvent').DataTable();
	$('#async_dataIntline').DataTable();
	$('#async_dataIntequipment').DataTable();
	$('#async_datatable').DataTable();
	$('#datetimepicker').datetimepicker(
		{
			format:'YYYY/MM/DD HH:mm',
			widgetPositioning: { horizontal: 'left' }
		});
})

// $(document).ready(function() {
// 	$('.nav-trigger').click(function(e) {
// 		console.log('js working');
// 		 e.preventDefault();
// 		$('.side-nav').toggleClass('visible');
//
// 	});
// });
