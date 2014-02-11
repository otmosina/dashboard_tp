
function DrawBar_InitsAndShows(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.inits.dates,
    datasets: [
      {
        fillColor : "rgba(36,214,150,0.1)",
        strokeColor : "#24d696",
        data: data.inits.values
      },
      {
        fillColor : "rgba(229,148,0,0.1)",
        strokeColor : "#e59400",
        data : data.shows.values
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
    ChartInstance.Bar(dataSource, options);
}


function DrawBar_LeadsAndSearches(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.leads.dates,
    datasets: [
      {
        fillColor : "rgba(229,0,5,0.1)",
        strokeColor : "#e50005",
        data : data.leads.values
      },
      {
        fillColor : "rgba(64,64,64,0.1)",
        strokeColor : "#404040",
        data : data.searches.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 150,
      scaleStartValue : 100
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Bar(dataSource, options);
}

function DrawBar_Profit(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.profits.dates,
    datasets: [
      {
        fillColor : "rgba(255,172,3,0.1)",
        strokeColor : "rgba(255,172,3,1)",
        pointColor: "rgba(255,172,3,1)",
        //pointStrokeColor: "#aaa",
        data : data.profits.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 50000,
      scaleStartValue : 10000
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_Paidbooking(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.paid_bookings.dates,
    datasets: [
      {
        fillColor : "rgba(0,0,170,0.1)",
        strokeColor : "#0000aa",
        pointColor: "#0000aa",
        //pointStrokeColor: "#aaa",
        data : data.paid_bookings.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 150,
      scaleStartValue : 100
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_Clicks(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.clicks.dates,
    datasets: [
      {
        fillColor : "rgba(97,38,158,0.1)",
        strokeColor : "#61269e",
        pointColor: "#61269e",
        //pointStrokeColor: "#aaa",
        data : data.clicks.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 3000,
      scaleStartValue : 100
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_Searches(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.searches.dates,
    datasets: [
      {
        fillColor : "rgba(64,64,64,0.1)",
        strokeColor : "#404040",
        pointColor: "#404040",
        //pointStrokeColor: "#aaa",
        data : data.searches.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 30000,
      scaleStartValue : 100
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_NewAffiliate(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.amount.dates,
    datasets: [
      {
        fillColor : "rgba(51,181,229,0.1)",
        strokeColor : "rgba(51,181,229,1)",
        pointColor: "rgba(51,181,229,1)",
        //pointStrokeColor: "#fff",
        data : data.amount.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 1,
      scaleStartValue : 0
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Bar(dataSource, options);
}

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

//For detailed page

function DrawBar_StatisticsSearchesAndProfit(data_statistics, data_profit, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data_statistics.clicks.dates,
    datasets: [
      {
        fillColor : "rgba(154,14,17,0.1)",
        strokeColor : "rgba(154,14,17,1)",
        pointColor: "rgba(154,14,17,1)",
        data : data_statistics.searches.values
      },
      {
        fillColor : "rgba(249,0,5,0.1)",
        strokeColor : "rgba(249,0,5,1)",
        pointColor: "rgba(249,0,5,1)",
        data : data_profit.profits.values
      }

    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 50000,
      scaleStartValue : 100,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_StatisticsClicksAndPaidbooking(data_statistics, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data_statistics.clicks.dates,
    datasets: [
      {
        fillColor : "rgba(154,14,17,0.1)",
        strokeColor : "rgba(154,14,17,1)",
        pointColor: "rgba(154,14,17,1)",
        data : data_statistics.clicks.values
      },
      {
        fillColor : "rgba(249,0,5,0.1)",
        strokeColor : "rgba(249,0,5,1)",
        pointColor: "rgba(249,0,5,1)",
        data : data_statistics.paid_bookings.values
      }

    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 2500,
      scaleStartValue : 100,
      scaleShowLabels : true
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Line(dataSource, options);
}

function DrawBar_NewAffiliateDay(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.amount.dates,
    datasets: [
      {
        fillColor : "rgba(51,181,229,0.1)",
        strokeColor : "rgba(51,181,229,1)",
        pointColor: "rgba(51,181,229,1)",
        //pointStrokeColor: "#fff",
        data : data.amount.values
      }
    ]
    }
    options = {
      scaleOverride : true,
      scaleFontSize: 12,
      scaleSteps : 10,
      scaleStepWidth : 5,
      scaleStartValue : 1
    }
    var ChartInstance = new Chart(ctx);
    ChartInstance.Bar(dataSource, options);
}



