
$(document).ready(function(){
  $("div#add_client").click(function(e){
    e.preventDefault();
    $(this).hide();
    $("div#client_list").remove();
    $("div.field_container").html($("#client_fields").html());
    $("div.field_container").show();
  });

  $("body").on("keydown", "#rental_client_attributes_phone_number", function(event){
    only_numbers();
  });
});
