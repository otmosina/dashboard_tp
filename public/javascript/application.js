
function DrawBar_EventsWithStatisticsInitAndShow(data_events, data_statistics, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data_events.inits.dates,
    datasets: [
      {
        fillColor : "rgba(4,90,59,0.1)",
        strokeColor : "rgba(4,90,59,1)",
        pointColor: "rgba(4,90,59,1)",
        data : data_events.inits.values
      },
      {
        fillColor : "rgba(22,216,146,0.1)",
        strokeColor : "rgba(22,216,146,1)",
        pointColor: "rgba(22,216,146,1)",
        data : data_statistics.inits.values
      },
      {
        fillColor : "rgba(133,88,4,0.1)",
        strokeColor : "rgba(133,88,4,1)",
        pointColor: "rgba(133,88,4,1)",
        data : data_events.shows.values
      },
      {
        fillColor : "rgba(229,148,0,0.1)",
        strokeColor : "rgba(229,148,0,1)",
        pointColor: "rgba(229,148,0,1)",
        data : data_statistics.shows.values
      }

    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 10000,
      scaleStartValue : 1000,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_EventsWithStatisticsLeadAndSearch(data_events, data_statistics, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data_events.leads.dates,
    datasets: [
      {
        fillColor : "rgba(154,14,17,0.1)",
        strokeColor : "rgba(154,14,17,1)",
        pointColor: "rgba(154,14,17,1)",
        data : data_events.leads.values
      },
      {
        fillColor : "rgba(249,0,5,0.1)",
        strokeColor : "rgba(249,0,5,1)",
        pointColor: "rgba(249,0,5,1)",
        data : data_statistics.leads.values
      },
      {
        fillColor : "rgba(64,64,64,0.1)",
        strokeColor : "rgba(64,64,64,1)",
        pointColor: "rgba(64,64,64,1)",
        data : data_events.searches.values
      },
      {
        fillColor : "rgba(148,147,147,0.1)",
        strokeColor : "rgba(148,147,147,0,1)",
        pointColor: "rgba(148,147,147,1)",
        data : data_statistics.searches.values
      }

    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 150,
      scaleStartValue : 100,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function Draw_СompareFourLines(data_line1, data_line2, data_line3, data_line4, dom_output, stepWidth){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data_line1.dates,
    datasets: [
      {
        fillColor : "rgba(154,14,17,0.1)",
        strokeColor : "rgba(154,14,17,1)",
        pointColor: "rgba(154,14,17,1)",
        data : data_line1.values
      },
      {
        fillColor : "rgba(249,0,5,0.1)",
        strokeColor : "rgba(249,0,5,1)",
        pointColor: "rgba(249,0,5,1)",
        data : data_line2.values
      },
      {
        fillColor : "rgba(64,64,64,0.1)",
        strokeColor : "rgba(64,64,64,1)",
        pointColor: "rgba(64,64,64,1)",
        data : data_line3.values
      },
      {
        fillColor : "rgba(148,147,147,0.1)",
        strokeColor : "rgba(148,147,147,0,1)",
        pointColor: "rgba(148,147,147,1)",
        data : data_line4.values
      }

    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : stepWidth,
      scaleStartValue : 100,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}



//now day week
//==============
 function Draw_ThreePeriod(data, dom_output, stepWidth){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.first_series.dates,
    datasets: [
      {
        fillColor : "rgba(22,216,146,0.1)",
        strokeColor : "rgba(22,216,146,1)",
        pointColor: "rgba(22,216,146,1)",
        data : data.first_series.values
      },
      {
        fillColor : "rgba(229,148,0,0.1)",
        strokeColor : "rgba(229,148,0,1)",
        pointColor: "rgba(229,148,0,1)",
        data : data.second_series.values
      },
      {
        fillColor : "rgba(249,0,5,0.1)",
        strokeColor : "rgba(249,0,5,1)",
        pointColor: "rgba(249,0,5,1)",
        data : data.third_series.values
      },
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : stepWidth,
      scaleStartValue : 0,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

 function Draw_TwoPeriod(data, dom_output, stepWidth){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.first_series.dates,
    datasets: [
      {
        fillColor : "rgba(22,216,146,0.1)",
        strokeColor : "rgba(22,216,146,1)",
        pointColor: "rgba(22,216,146,1)",
        data : data.first_series.values
      },
      {
        fillColor : "rgba(229,148,0,0.1)",
        strokeColor : "rgba(229,148,0,1)",
        pointColor: "rgba(229,148,0,1)",
        data : data.second_series.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : stepWidth,
      scaleStartValue : 0,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

 function Draw_OnePeriod(data, dom_output, stepWidth){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.first_series.values,
    datasets: [
      {
        fillColor : "rgba(22,216,146,0.1)",
        strokeColor : "rgba(22,216,146,1)",
        pointColor: "rgba(22,216,146,1)",
        data : data.first_series.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : stepWidth,
      scaleStartValue : 0,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}




