// Block form submission if there are required fields.
// Original: http://stackoverflow.com/questions/5929186/how-to-prevent-form-submission-while-using-html5-client-side-form-validation-in
(function() {
  "use strict";
  window.addEventListener("load", function() {
    var form = document.getElementById("eloquaForm");

    form.addEventListener("submit", function(event) {
      // Prevent form submission and contact with server
      if (form.checkValidity() == false) {
        event.preventDefault();
        event.stopPropagation();
      } else {
        // After field validation, check for reCaptcha Validation Client Side
        grecaptcha.execute();
        var response = grecaptcha.getResponse();

        if( response === '' || response === null || response === undefined ) {
            event.preventDefault();
            event.stopPropagation();
        }
        //console.log('Passed Client Side Validation');

        // After field validation, check for reCaptcha Validation Server Side
        onSubmit();
      }

      // Add a class when we attempt to validate so we can scope CSS to this state.
      // Otherwise, browsers load with the `:invalid` state applied.
      form.classList.add("validated");
    }, false);
  }, false);
}());
