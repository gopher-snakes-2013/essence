var textSelection = {

  init: function(){
    $('')
  }
}
$(document).ready(function(){
  textSelection.init();
})


// var WorkSpace = function(){
//   this.addSnippet;
// };

// WorkSpace.prototype.addSnippet = function(){
//   var selectionClone = window.getSelection().getRangeAt(0).cloneContents().children;
//   Array.prototype.slice.call(.getRangeAt(0).cloneContents().children).map(function(div){return div.innerText}).join(' ')
// };

// var Snippet = function( text ){
//   this.text = text;
// };

// Snippet.prototype.parseText = function(){
//   Array.prototype.slice.call(this.text).map(function(div){
//     return div.innerText
//   }.join(' '))
// }

// $(function() {
//   new WorkSpace();
// })