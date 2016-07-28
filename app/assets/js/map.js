function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 42.3601, lng: -71.0589},
    zoom: 13
  });
  var input = /** @type {!HTMLInputElement} */(
      document.getElementById('pac-input'));

  var types = document.getElementById('type-selector');
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });


  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    place = autocomplete.getPlace();
    if (!place.geometry) {
      window.alert("Autocomplete's returned place contains no geometry");
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
  });
}

$(function () {
$('.trigger').click(function (event) {
  event.preventDefault();
    $.ajax({
      url: '/api/laundromats',
      method: 'POST',
      data: { laundromat: {
        name: place.name,
        address: place.address_components[0].short_name + " " + place.address_components[1].short_name,
        city: place.address_components[3].short_name,
        state: place.address_components[5].long_name,
        zip_code: place.address_components[7].short_name
      }}
    }).done(function(data) {
    })
    .fail(function(response) {
      data = response.responseJSON;
    });
    console.log('Success');
    location.reload();
});
});
