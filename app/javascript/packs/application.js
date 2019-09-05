import "bootstrap";
import "../plugins/flatpickr"

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { createAppointment } from '../plugins/create_appointment';

initMapbox();
createAppointment();

//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree.
