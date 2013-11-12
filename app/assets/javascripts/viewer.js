var Viewer = {
  url: 'http://cdn.mozilla.net/pdfjs/tracemonkey.pdf',
  init: function() {
    var self = this;
    PDFJS.disableWorker = true;
    PDFJS.getDocument(this.url).then(function(pdfDoc) {
      self.renderPage(1, pdfDoc)
    })
  },
  renderPage: function(num, pdfDoc) {
     var  pageNum = 1,
          scale = 0.8,
          canvas = document.getElementById('the-canvas'),
          ctx = canvas.getContext('2d');
      pdfDoc.getPage(num).then(function(page) {
        var viewport = page.getViewport(scale);
        canvas.height = viewport.height;
        canvas.width = viewport.width;

        // Render PDF page into canvas context
        var renderContext = {
          canvasContext: ctx,
          viewport: viewport
        };
        page.render(renderContext);
      });
    }
}

$(document).ready(function() {
  // Viewer.init();
})