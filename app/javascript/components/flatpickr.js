const flatpickr = require("flatpickr");


const datePickr = () => {
  const el = document.getElementsByClassName("flatpickr-input");
  flatpickr(el);
};

export { datePickr };
