window.APP = {
  // A call to this method is made from the body in the html to help turbolinks
  pageChanged: function(){
    this.initPageSpecificJavascript();
  },
  initPageSpecificJavascript: function(){
    window.dataScript = document.body.getAttribute("id");

  	if (APP.pages && APP.pages[dataScript]){
  		APP.currentPage = new APP.pages[dataScript]();
  	}
    else
      APP.currentPage = {};  // need something defined so we know the app loaded once
  }
};
