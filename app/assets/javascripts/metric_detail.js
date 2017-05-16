/**
 * Created by Joe on 5/15/17.
 */

$(document).on('turbolinks:load', function () {
    $('#comment_form').submit(function () {
        var params = {
            'offset_top': $(this).offset().top,
            'offset_left': $(this).offset().left
        };
        $('#params').attr('value', JSON.stringify(params));
        $('#metric_sample_id').attr('value', parent_metric.id);
        var valuesToSubmit = $(this).serialize();
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'), //sumbits it to the given url of the form
            data: valuesToSubmit,
            dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
        }).success(function (json) {
            $('#content').val('');
            var params = JSON.parse(json['params']);
            d3.select('body')
                .append('div')
                .style('top', params['offset_top'] + 'px')
                .style('left', params['offset_left'] + 'px')
                .attr('class', 'comments')
                .append('p')
                .attr('class', 'bg-primary')
                .html(json['content']);
        });
        return false; // prevents normal behaviour
    });

    $('#button_clear').click(function () {
        $('#content').val('');
        return false;
    });
});
