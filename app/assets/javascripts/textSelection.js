var textSelection = {

  init: function(){
    $('.add-snippet').on('click', textSelection.captureTextSelection);
  },

  captureTextSelection: function(e){
    e.preventDefault();
    console.log(textSelection.getTextOfSelectedDivs(textSelection.cloneSelectedDivs()))
  },

  cloneSelectedDivs: function(){
    return window.getSelection().getRangeAt(0).cloneContents().children;
  },

  getTextOfSelectedDivs: function(selectedDivs){
    return Array.prototype.slice.call(selectedDivs).map(function(div){return div.innerText}).join(' ')
  }

}

$(document).ready(function(){
  textSelection.init();
})