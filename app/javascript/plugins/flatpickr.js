import flatpickr from "flatpickr";

const initFlatpickr = () => {
	flatpickr(".datepicker", {
		altInput: true,
		defaultDate: document.querySelector(".datepicker").dataset.default
	});
};

export { initFlatpickr } ;