$(document).ready(function(){
    var settings_url = 'http://' + window.location.hostname + '/module/GoogleManyMarkers/module-googlemanymarkers-settings';
    var markers_url = 'http://' + window.location.hostname + '/module/GoogleManyMarkers/module-googlemanymarkers-markers';
    
    
    var settings,markers;
    $.get( settings_url, function( data ) {
        var formated = JSON.parse(data.replace('</body></html>',''));
        settings = formated;
        initMarkers();
    });
    
    function initMarkers() 
    {
        $.get( markers_url, function( data ) {
            var formated = JSON.parse(data.replace('</body></html>',''));
            markers = formated;
            init();
         });
    }
    
    function init() {
        console.log(markers);
        
        var locations = [];
        for(var i = 0; i < markers.length; i++) {
            var tmp = [
                '<h4>' + markers[i].marker_name + '</h4>' + 
                        '<p>' + markers[i].street + '</p>' +
                        '<p>' + markers[i].phone + '</p>' +
                        '<p>' + markers[i].postcode + ' ' + markers[i].city + '</p>' + '\
                        <p><a href="' + markers[i].url + '"> ' + markers[i].url + '</a> </p>'
                        , markers[i].latitude, markers[i].longitude]; 
            locations.push(tmp);
        }
        
        var LatLng = settings[2].option_value.split(',');
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: parseInt(settings[1].option_value),
          center: new google.maps.LatLng(LatLng[0],LatLng[1]),
          styles: JSON.parse(settings[3].option_value)
        });

        var infowindow = new google.maps.InfoWindow();

        var marker, i;
        var arrMarkers = {};
        var image = settings[5].option_value;

        for (i = 0; i < locations.length; i++) {  
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map,
            icon: image
          });

          arrMarkers[i] = marker;

          google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
              infowindow.setContent(locations[i][0]);
              infowindow.open(map, marker);
              map.setZoom(15);
              map.setCenter(marker.getPosition());
            }
          })(marker, i));

        }


      $('.locations-holder .address-row h4').click(function(){
        var marker_num = $(this).parent().attr('data-marker');
        map.setZoom(15);
        map.setCenter(arrMarkers[marker_num].getPosition());
        infowindow.setContent(locations[marker_num][0]);
        infowindow.open(map, arrMarkers[marker_num]);
      })


      $('.google-maps-module .searcher input[name="gmSearch"]').on('input',function() {

        if (this.value == '') {
          return 0;
        }

        var val = this.value.toLowerCase();
        var elements = $('.locations-holder .address-row');
        var results = [];
        var output;

        for(var i=0; i < elements.length; i++) {
          var zipcode = elements.eq(i).find('.zipcode').text().toLowerCase();
          var city = elements.eq(i).find('.city').text().toLowerCase();

          var search_zipcode = zipcode.search(val);
          var search_city = city.search(val);
          // if(myExp.search(myExp)) {
          if(search_zipcode != -1 || search_city != -1) {
            results.push(elements.eq(i));
          }
          // }

        }


        output = '<ul>';
        for(j=0;j < results.length; j++) {
          output += '<li ' + 'data-marker="' +  results[j].attr('data-marker') + '">'
                        + '<strong class="title">' + results[j].find('h4').text() + ' - </strong>'
                        + results[j].find('.zipcode').text() + '<strong>' 
                        + results[j].find('.city').text() 
                        + '</strong></li>' ;
        }
        output += '</ul>';

        $('.google-maps-module .searcher .results').html(output);

      });


      $(document).on('click', '.google-maps-module .searcher .results ul li', function(){ 
        var marker = $(this).attr('data-marker');
        $(this).parent().remove();
        $('.locations-holder .address-row[data-marker="' + marker + '"] h4').click();
      });

      $(document).on('click','body', function() {
        $('.google-maps-module .searcher .results ul').remove();
      });
  }
  
  
});
