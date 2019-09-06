import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!


if(document.querySelector('.datepicker')){
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true,
    time_24hr: true,
    inline: true,
    dateFormat: "d/m/Y, H:i",
    minTime: document.getElementById('appointment_laboratory_id' ).dataset.openingTime,
    maxTime: document.getElementById('appointment_laboratory_id' ).dataset.closingTime,
    onChange: function(selectedDates, dateStr, instance) {
      document.getElementById('date-modal').innerHTML = 'Data / horário: ' + dateStr;
      document.getElementById('date-button').classList.remove('disabled');
    },
  })


}

