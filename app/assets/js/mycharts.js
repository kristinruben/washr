function laundry() {
  $dryerData = [];
  $washerData = [];
  $labelsArray = [];
  $laundromatId = document.getElementById('laundo-id').innerHTML;
  var $response = $.get('/api/laundromats/',
    function(data) {
      $.each(data, function(k, v) {
        $.each(v.washers, function(l, w) {
          $labelsArray.push(w.created_at);
        });
      });
        $.each(data, function(k, v) {
          $.each(v.washers, function(l, w) {
            $washerData.push(w.number_available);
          });
        });
        $.each(data, function(k, v) {
          $.each(v.dryers, function(x, y) {
            $dryerData.push(y.number_available);
        });
      });
      laundryData($labelsArray, $washerData, $dryerData);
    });
  }
