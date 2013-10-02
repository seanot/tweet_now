var statusCheck = function() {

}

$(document).ready(function() {
  $('#submit_tweet').on('submit', function(event) {
    event.preventDefault();
    url = $(this).attr('action');
    data = $('#submit_tweet').serialize();
    console.log(data);
    
    var checkStatus = function() { 
        $.ajax({
        url: url,
        type: 'POST',
        data: data,
      })
      .done(function(response) {
        $('body').append(response);
        console.log("success");
        console.log(response);
      })
      .fail(function() {
        console.log("error");
        setIterval(checkStatus, 1000);
      })
      .always(function() {
        console.log("complete");
      });
    } 

    this.reset();
    checkStatus();
      


    
  }); // submit
}); // doc ready
