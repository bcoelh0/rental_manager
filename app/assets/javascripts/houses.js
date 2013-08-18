

$(document).ready(function(){
  $("div#add_owner").click(function(e){
    e.preventDefault();
    $(this).hide();
    $("div#owner_list").remove();
    $("div.field_container").html($("#owner_fields").html());
    $("div.field_container").show();
  });

  $("body").on("keydown", "#house_owner_attributes_phone_number", function(event){
    only_numbers();
  });
});
