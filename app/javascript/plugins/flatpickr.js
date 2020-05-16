import flatpickr from "flatpickr";

const initFlatpickr = () => {
	flatpickr(".datepicker", {
		altInput: true,
		defaultDate: document.querySelector(".datepicker").dataset.default,
		disable: document.querySelector(".datepicker").dataset.blocked.split(',')
	});
};

const initFlatpickrCalendar = () => {
	flatpickr(".datepicker-calendar", {
		altInput: true,
		disable: document.querySelector(".datepicker-calendar").dataset.calendar.split(','),
		mode: "multiple",
	});
};

export { initFlatpickr, initFlatpickrCalendar } ;