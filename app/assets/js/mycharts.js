function laundry() {
  $dryerData = [];
  $washerData = [];
  $labelsArray = [];
  $laundromatId = $('#laundo-id')[0].innerHTML;
  var $response = $.get('/api/laundromats/',
    function(data) {
      debugger;
      $.each(data, function(k,v) {
        $labelsArray.push(v.created_at);
        $.each(data, function(k, v) {
          $washerData.push(v.number_available);
          $.each(data, function(k, v) {
            $dryerData.push(v.number_available);
        });
      });
      laundryData($labelsArray, $washerData, $dryerData);
    });
  });
}
function laundryData(soap, washerData, dryerData) {
  var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: soap,
    datasets: [
      {
        label: "WASHERS",
        fill: true,
        lineTension: 0.1,
        backgroundColor: "#0192B4",
        borderColor: "#0192B4",
        borderCapStyle: 'butt',
        borderDash: [],
        borderDashOffset: 0.0,
        borderJoinStyle: 'miter',
        pointBorderColor: "rgba(75,192,192,1)",
        pointBackgroundColor: "#fff",
        pointBorderWidth: 0,
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgba(75,192,192,1)",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointHoverBorderWidth: 2,
        pointRadius: 0,
        pointHitRadius: 10,
        data: washerData
      },
      {
        label: "DRYERS",
        fill: true,
        lineTension: 0.1,
        backgroundColor: "#C7CDCE",
        borderColor: "#C7CDCE",
        borderCapStyle: 'butt',
        borderDash: [],
        borderDashOffset: 0.0,
        borderJoinStyle: 'miter',
        pointBorderColor: "rgba(75,192,192,1)",
        pointBackgroundColor: "#fff",
        pointBorderWidth: 0,
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgba(75,192,192,1)",
        pointHoverBorderColor: "rgba(220,220,220,1)",
        pointHoverBorderWidth: 2,
        pointRadius: 0,
        pointHitRadius: 10,
        data: dryerData
      }
    ]
  },
  options: {
    scales: {

            xAxes: [{
              type: 'time',
                time: {
                    unit: 'day'
                }
            }]

    }
  }
});
};
