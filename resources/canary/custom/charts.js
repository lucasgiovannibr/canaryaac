
$(window).on('load', function () {
  'use strict';

  var chartWrapper = $('.chartjs'),
    flatPicker = $('.flat-picker'),
    barChartEx = $('.bar-chart-ex'),
    horizontalBarChartEx = $('.horizontal-bar-chart-ex'),
    lineChartEx = $('.line-chart-ex'),
    radarChartEx = $('.radar-chart-ex'),
    polarAreaChartEx = $('.polar-area-chart-ex'),
    bubbleChartEx = $('.bubble-chart-ex'),
    doughnutChartEx = $('.doughnut-chart-ex'),
    scatterChartEx = $('.scatter-chart-ex'),
    lineAreaChartEx = $('.line-area-chart-ex');

  // Color Variables
  var primaryColorShade = '#836AF9',
    yellowColor = '#ffe800',
    successColorShade = '#28dac6',
    warningColorShade = '#ffe802',
    warningLightColor = '#FDAC34',
    infoColorShade = '#299AFF',
    greyColor = '#4F5D70',
    blueColor = '#2c9aff',
    blueLightColor = '#84D0FF',
    greyLightColor = '#EDF1F4',
    tooltipShadow = 'rgba(0, 0, 0, 0.25)',
    lineChartPrimary = '#666ee8',
    lineChartDanger = '#ff4961',
    labelColor = '#6e6b7b',
    grid_line_color = 'rgba(200, 200, 200, 0.2)'; // RGBA color helps in dark layout

  // Detect Dark Layout
  if ($('html').hasClass('dark-layout')) {
    labelColor = '#b4b7bd';
  }

  // Wrap charts with div of height according to their data-height
  if (chartWrapper.length) {
    chartWrapper.each(function () {
      $(this).wrap($('<div style="height:' + this.getAttribute('data-height') + 'px"></div>'));
    });
  }

  
  // Doughnut Chart
  // --------------------------------------------------------------------
  if (doughnutChartEx.length) {
    var doughnutExample = new Chart(doughnutChartEx, {
      type: 'doughnut',
      options: {
        responsive: true,
        maintainAspectRatio: false,
        responsiveAnimationDuration: 500,
        cutoutPercentage: 60,
        legend: { display: false },
        tooltips: {
          callbacks: {
            label: function (tooltipItem, data) {
              var label = data.datasets[0].labels[tooltipItem.index] || '',
                value = data.datasets[0].data[tooltipItem.index];
              var output = ' ' + label + ' : ' + value + ' %';
              return output;
            }
          },
          // Updated default tooltip UI
          shadowOffsetX: 1,
          shadowOffsetY: 1,
          shadowBlur: 8,
          shadowColor: tooltipShadow,
          backgroundColor: window.colors.solid.white,
          titleFontColor: window.colors.solid.black,
          bodyFontColor: window.colors.solid.black
        }
      },
      data: {
        datasets: [
          {
            labels: ['Sorcerer', 'Druid', 'Knight', 'Paladin'],
            data: [30, 30, 20, 20],
            backgroundColor: [successColorShade, warningLightColor, window.colors.solid.primary, yellowColor],
            borderWidth: 0,
            pointStyle: 'rectRounded'
          }
        ]
      }
    });
  }
  
  
  
  


  });
  