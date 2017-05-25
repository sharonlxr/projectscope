/**
 * Created by Joe on 5/25/17.
 */

function travis_ci(containerID, data) {
    if (data.current_state) {
        var color = data.current_state === 'passed' ? 'green' : 'red';
        var success_rate = parseFloat(data.success_builds) / parseFloat(data.total_builds);
        d3.select('#' + containerID)
            .style('background-color', color)
            .style('width', (100.0 * success_rate) + '%')
            .style('float', 'left')
            .html(success_rate.toPrecision(2));
    } else {
        d3.select('#' + containerID)
            .style('background-color', 'gray')
            .style('width', 100.0 + '%')
            .style('float', 'left')
            .html('No build found.');
    }
}