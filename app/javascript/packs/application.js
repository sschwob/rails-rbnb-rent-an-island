// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports
import { initSweetalert } from '../plugins/init_sweetalert';
import { initFlatpickr } from "../plugins/flatpickr";
import { searchFlagImg } from "../plugins/flags";
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {

  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
  });

  initFlatpickr();

  initSweetalert('.sweet-alert-warning', {
    title: "Are you sure?",
    text: "This action cannot be reversed",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }, (value) => {
    if (value) {
      const link = document.getElementById(`${window.islandId}`);
      link.click();
    }
  });

  searchFlagImg();

});


document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
