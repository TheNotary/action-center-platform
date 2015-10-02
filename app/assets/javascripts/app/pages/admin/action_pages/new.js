window.APP = window.APP || {};
window.APP.pages = window.APP.pages || {};

var page_id = "action_pages-new";

window.APP.pages[page_id] = function() {
	$(document).ready(function() {
		IndeterminateCheckbox.init();
  });
};
