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
import { swapImg } from '../plugins/swapimg';
import { zoomIn } from '../plugins/zoomin';
import { initSelect2 } from '../plugins/init_select2';

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

  initMapbox();

  initSelect2();

  searchFlagImg();

  swapImg();

  zoomIn();

  (function() {
    "use strict";
  
    var carousel = document.getElementsByClassName('carousel')[0],
        slider = carousel.getElementsByClassName('carousel__slider')[0],
        items = carousel.getElementsByClassName('carousel__slider__item'),
        prevBtn = carousel.getElementsByClassName('carousel__prev')[0],
        nextBtn = carousel.getElementsByClassName('carousel__next')[0];
    
    var width, height, totalWidth, margin = 20,
        currIndex = 0,
        interval, intervalTime = 4000;
    
    function init() {
        resize();
        move(Math.floor(items.length / 2));
        bindEvents();
      
        timer();
    }
    
    function resize() {
        width = Math.max(window.innerWidth * .25, 275),
        height = window.innerHeight * .5,
        totalWidth = width * items.length;
      
        slider.style.width = totalWidth + "px";
      
        for(var i = 0; i < items.length; i++) {
            let item = items[i];
            item.style.width = (width - (margin * 2)) + "px";
            item.style.height = height + "px";
        }
    }
    
    function move(index) {
      
        if(index < 1) index = items.length;
        if(index > items.length) index = 1;
        currIndex = index;
      
        for(var i = 0; i < items.length; i++) {
            let item = items[i],
                box = item.getElementsByClassName('item__3d-frame')[0];
            if(i == (index - 1)) {
                item.classList.add('carousel__slider__item--active');
                box.style.transform = "perspective(1200px)"; 
            } else {
              item.classList.remove('carousel__slider__item--active');
                box.style.transform = "perspective(1200px) rotateY(" + (i < (index - 1) ? 40 : -40) + "deg)";
            }
        }
      
        slider.style.transform = "translate3d(" + ((index * -width) + (width / 2) + window.innerWidth / 2) + "px, 0, 0)";
    }
    
    function timer() {
        clearInterval(interval);    
        interval = setInterval(() => {
          move(++currIndex);
        }, intervalTime);    
    }
    
    function prev() {
      move(--currIndex);
      timer();
    }
    
    function next() {
      move(++currIndex);    
      timer();
    }
    
    function bindEvents() {
        window.onresize = resize;
        prevBtn.addEventListener('click', () => { prev(); });
        nextBtn.addEventListener('click', () => { next(); });    
    }
    
    init();
    
  })();

});
