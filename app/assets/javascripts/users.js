var ready = function() {
	$('#check_all').on("click", function(){ 
		var project_checkboxes = $('.project_checkbox');
		var metric_checkboxes = $('.metric_checkbox');
		if (this.checked) {
			$.each(project_checkboxes, function(index, el) {
				if (el.checked !== true) {
					el.click();
				}
			});
			$.each(metric_checkboxes, function(index, el) {
				if (el.checked !== true) {
					el.click();
				}
			});
		}
	});
};

$(document).on('turbolinks:load', ready);
$(document).ready(ready);