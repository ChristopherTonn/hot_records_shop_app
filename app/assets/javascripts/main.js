$(document).on('turbolinks:load', function(){
  $("#zoom_07").elevateZoom({
    zoomType: "lens",
    lensShape: "round",
    lensSize: 300
  });

  $("#zoom_05").elevateZoom({
    zoomType				: "inner",
    cursor: "crosshair"
  });
});
