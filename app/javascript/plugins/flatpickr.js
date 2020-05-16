import flatpickr from "flatpickr";

const initFlatpickr = () => {
	flatpickr(".datepicker", {
		altInput: true,
		defaultDate: document.querySelector(".datepicker").dataset.default,
		disable: document.querySelector(".datepicker").dataset.blocked.split(',')
	});
};

export { initFlatpickr } ;