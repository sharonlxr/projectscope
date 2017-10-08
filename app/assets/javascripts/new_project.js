// Created by An at Oct. 8, 2017

// $(document).ready(ready);


// The function that sets up the page once it's loaded.
var ready = function () {
    loading_page();
    render_charts();
    $("#date-slider").slider({
        value: 100,
        min: -$("#date-slider").attr("num_days_from_min"),
        max: 0,
        step: 1,
        slide: function (event, ui) {
            var days_from_now = -1 * ui.value;
            request_for_metrics(days_from_now);
        }
    });

    $(".date-nav").unbind().click(function (event) {
        console.log('here');
        var date_slider = $("#date-slider");
        var days_from_now = -1 * date_slider.slider("value");
        days_from_now += this.id === "day-before" ? 1 : -1;
        if (days_from_now < 0) {
            days_from_now = 0;
            return;
        }
        request_for_metrics(days_from_now);
        date_slider.slider("value", -1 * days_from_now);
    });
    update_date_label(days);
    $("#date-slider").slider("value", -1 * days);
};


// Present a loading status of the page
var loading_page = function () {

};

// Render charts
var render_charts = function () {

};
