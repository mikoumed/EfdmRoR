
var initialize_calendar;
initialize_calendar = function(){
	$('.calendar').each(function(){
		var isClicked = false
		var calendar = $(this)
		calendar.fullCalendar({
			height: 600,

			dayClick: function(date, jsEvent, view) {
			    if(isClicked){
			        isDblClicked = true;
			        isClicked = false;
			    }
			    else{
			        isClicked = true;
			    }
			    setTimeout(function(){
			        isClicked = false;
			    }, 250);
			 },
			select: function(start, end, jsEvent){
			    if(isClicked){
			        $(this).fullCalendar('unselect');
			        return;
			    }
				$.getScript('/issues/new', function() {
					$('#issue_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"));
					date_range_picker();
					$('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
					$('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
				})
			},

			header: {
				left: 'prev,next,today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,list'
			},
			selectable: true,
			selectHepler: true,
			editable: true,
			eventLimit: true,
			events: '/issues.json',

			eventDrop: function(issue, delta, revertFunc){
				issue_data = {
					issue: {
						id: issue.id,
						start: issue.start.format(),
						end: issue.end.format(),
					}
				};
				$.ajax({
					url: issue.update_url,
					data: issue_data,
					type: 'PATCH'
				});
			},

			eventClick: function(issue, jsIssue, view){
				$.getScript(issue.edit_url, function() {
					$('#issue_date_range').val(moment(issue.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(issue.end).format("MM/DD/YYYY HH:mm"));
					date_range_picker();
					$('.start_hidden').val(moment(issue.start).format('YYYY-MM-DD HH:mm'));
					$('.end_hidden').val(moment(issue.end).format('YYYY-MM-DD HH:mm'));
				});
			}
		});
	})
};
$(document).on('turbolinks:load', initialize_calendar);
