/**
 * Created by Joe on 5/24/17.
 */

function pull_requests(containerID, data) {
    if (data.total === 0) {
        d3.select('#' + containerID)
            .style('background-color', 'gray')
            .style('width', '100%')
            .style('float', 'left')
            .html('No Pull Request');
    } else {
        var open = data.open === 0 ? 0.5 : data.open;
        var commented = data.commented === 0 ? 0.5 : data.commented;
        var container = d3.select('#' + containerID)
            .style('width', '100%');
        container.append('div')
            .style('background-color', 'green')
            .style('width', (100.0 * open / data.total) + '%')
            .style('float', 'left')
            .html(open);
        container.append('div')
            .style('background-color', 'red')
            .style('width', (100.0 * (data.total - open) / data.total) + '%')
            .style('float', 'left')
            .html(data.closed);
        container.append('br');
        container.append('div')
            .style('background-color', 'green')
            .style('width', (100.0 * commented / data.total) + '%')
            .style('float', 'left')
            .html(open);
        container.append('div')
            .style('background-color', 'red')
            .style('width', (100.0 * (data.total - commented) / data.total) + '%')
            .style('float', 'left')
            .html(open);
    }
}