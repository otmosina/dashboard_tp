
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
        fillColor : "rgba(229,0,5,0.1)",
        strokeColor : "#ffc754",
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
    ChartInstance.Bar(dataSource, options);
}

function DrawBar_Paidbooking(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.paid_bookings.dates,
    datasets: [
      {
        fillColor : "rgba(229,0,5,0.1)",
        strokeColor : "#0000aa",
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
    ChartInstance.Bar(dataSource, options);
}

function DrawBar_Clicks(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.clicks.dates,
    datasets: [
      {
        fillColor : "rgba(229,0,5,0.1)",
        strokeColor : "#61269e",
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
    ChartInstance.Bar(dataSource, options);
}

function DrawBar_Searches(data, dom_output){
  var ctx = dom_output.get(0).getContext("2d");
  var dataSource = {
    labels: data.searches.dates,
    datasets: [
      {
        fillColor : "rgba(229,0,5,0.1)",
        strokeColor : "#404040",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
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
    ChartInstance.Bar(dataSource, options);
}

//          datasets: [
//              {
//                  fillColor: "rgba(220,220,220,0.5)",
//                  strokeColor: "rgba(220,220,220,1)",
//                  pointColor: "rgba(220,220,220,1)",
//                  pointStrokeColor: "#fff",
//                  data: data.values
//              }
//          ]
//      }

//      var myNewChart = new Chart(ctx).Line(data2);

