import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!


if(document.querySelector('.datepicker')){
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true,
    time_24hr: true,
    minTime: document.getElementById('appointment_laboratory_id' ).dataset.openingTime,
    maxTime: document.getElementById('appointment_laboratory_id' ).dataset.closingTime
  })


}

