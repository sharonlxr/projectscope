/**
 * Created by stevenwuyinze on 3/22/17.
 */


function parseChartParams(JSONStr) {
    var paramMap = JSONStr;
    var chartParams = {
        chart: {
            type: paramMap['chartType'],
            spacingBottom: 0,
            spacingTop: 0,
            spacingLeft: 0,
            spacingRight: 0,
            height: 250
        },
        title: {
            text: paramMap['titleText']
        },
        subtitle: {
            text: paramMap['subtitleText']
        },
        xAxis: {
            title: {
                margin: 0,
                text: paramMap['xAxisTitleText']
            },
            // labels: {
            //     formatter: function () {
            //         return this.value + paramMap['xAxisUnit'];
            //     }
            // },
            maxPadding: 0.01,
            // showLastLabel: true
        },
        yAxis: {
            title: {
                margin: 0,
                text: paramMap['yAxisTitleText']
            },
            maxPadding: 0.01
            // labels: {
            //     formatter: function () {
            //         return this.value + paramMap['yAxisUnit'];
            //     }
            // },
            //lineWidth: 2
        },
        // legend: {
        //     enabled: false
        // },
        // tooltip: {
        //     headerFormat: '<b>{series.name}</b><br/>',
        //     pointFormat: '{point.x} km: {point.y}°C'
        // },
        // plotOptions: {
        //     spline: {
        //         marker: {
        //             enable: false
        //         }
        //     }
        // },
        series: [{
            data: [[0, 15], [10, -50], [20, -56.5], [30, -46.5], [40, -22.1],
                [50, -2.5], [60, -27.7], [70, -55.7], [80, -76.5]]
        }]
    };
    return chartParams
}

function drawHighCharts(containerID, JSONStr) {
    Highcharts.chart(containerID, parseChartParams(JSONStr));
}