$(document).ready(function(){
  $('#doc_info').hide();
  $('#user_role_id').on('change', function(){
    if($('#user_role_id option:selected').text()=='DOCTOR'){
      $('#doc_info').show();
    } else {
      $('#doc_info').hide();
    }
  });
});