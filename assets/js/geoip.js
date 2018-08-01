(function() {
  "use strict";
  window.addEventListener("load", function() {
    var onSuccess = function(location){
      var country = location.country.iso_code;
      document.getElementById("country").value = country;
      var subdivision = location.most_specific_subdivision.names.en;
      document.getElementById("subdivision").value = subdivision;
      var city = location.city.names.en;
      document.getElementById("city").value = city;
    }

    geoip2.city(onSuccess);
  }, false);
}());
