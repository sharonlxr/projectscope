/**
 * Created by Joe on 5/1/17.
 */

function gauge(containerID, data) {
    var color = d3.scaleLinear().domain([0.0, 2.0, 4.0]).range(['red', 'yellow', 'green']);
    d3.select('#' + containerID)
        .style('background-color', color(data.data.score))
        .style('width', (100.0 * data.data.score / 4.0) + '%')
        .style('float', 'left')
        .html('GPA: ' + data.data.score);
}