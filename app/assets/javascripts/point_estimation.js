/**
 * Created by Joe on 4/26/17.
 */

function point_estimation(containerID, plotdata) {
    var point_data = plotdata.data.map(function (d) {
        if (d.estimate !== undefined) {
            return [0, d.dev_time];
        } else {
            return [d.estimate, d.dev_time];
        }
    });
    Highcharts.chart(containerID, {
        chart: {
            type: 'scatter',
            zoomType: 'xy'
        },
        title: {
            text: 'Point Estimation'
        },
        xAxis: {
            title: {
                enabled: true,
                text: 'Development Time'
            },
            startOnTick: true,
            endOnTick: true
        },
        yAxis: {
            title: {
                text: 'Point Estimation'
            }
        },
        /*
         legend: {
         layout: 'vertical',
         align: 'left',
         verticalAlign: 'top',
         x: 100,
         y: 70,
         floating: true,
         backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
         borderWidth: 1
         },
         */
        plotOptions: {
            scatter: {
                marker: {
                    radius: 5,
                    states: {
                        hover: {
                            enabled: true,
                            lineColor: 'rgb(100,100,100)'
                        }
                    }
                },
                states: {
                    hover: {
                        marker: {
                            enabled: false
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br>',
                    pointFormat: '{point.x} points, {point.y} seconds to finish'
                }
            }
        },
        series: [{
            name: 'Stories',
            color: 'rgba(119, 152, 191, .5)',
            data: point_data
        }]
    });
}
