$(document).ready(function() {
  $("#conclusions").on("click", function(event) {
    console.log("#conclusions is being found");
    event.preventDefault();
    $("li").removeClass("active");
    $(this).addClass("active");
    //$("#experiment_content").html(<%= render 'conclusions' %>);
  });

});
