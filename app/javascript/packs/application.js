import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Estas seguro?",
  icon: "warning",
  buttons: true,
  dangerMode: true



}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }

});
