window.$ = $;
window.jQuery = $;

import "bootstrap";
import "../plugins/flatpickr"

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initSidebar } from '../plugins/init_sidebar';


initMapbox();
initSidebar();


