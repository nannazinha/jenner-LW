import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
  allowInput: true,
  enableTime: true,
  time_24hr: true,
  minTime: "08:00",
  maxTime: "18:00"
})
