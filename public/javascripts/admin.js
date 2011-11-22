$(document).ready(function() {
  init_nav_sorting();
  init_messaging();
});

function init_messaging(){
  $('.messages a.delete').click(function(e){
      e.preventDefault();
		  $('.messages').fadeOut("fast")
	});
}
function init_nav_sorting(){
  $("table.sortable tbody").sortable({
    handle: '.sort',
    update: function(event, ui) {
      $.ajax({
        type: "POST",
        dataType: 'json',
        url: $(ui.item).find('.sort').attr('href'),
        data: $(this).sortable("serialize"),
        success: function(response) {
        }
      });
    }
    });
  $('table.sortable a.sort').click(function(e){
    e.preventDefault();
  })
}
