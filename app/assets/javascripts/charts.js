$(function () {
    $('.charts-container').each( function() {
        data = []
        res = $(this).data('results').split(";")
        for (var i = 0; i < res.length; i++) {
            split = res[i].split(",")
            data[i] = {name: split[0], y: parseInt(split[1])}
        }
        $(this).highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: $(this).data("name")
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Resultados',
                colorByPoint: true,
                data: data
            }]
        });
    })
});