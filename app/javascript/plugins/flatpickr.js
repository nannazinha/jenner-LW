import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

let url = new URL(window.location.href);
let searchParams = new URLSearchParams(url.search);

flatpickr(".datepicker", {
  altInput: true,
  allowInput: true,
  enableTime: true,
  time_24hr: true,
  minTime: `${searchParams.get('opening')}:00`,
  maxTime: `${searchParams.get('closing')}:00`
})

