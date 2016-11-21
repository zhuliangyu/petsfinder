var DOMAIN = "http://localhost:3000";

$(function(){
  getUser();
});

function getUser(){
  $.ajax({
    url: `${DOMAIN}/users/1.json`,
    success: function(user){
      // console.log(question);
      // window.question = question;
      renderUser(user);
    },
    error: function(){
      alert('Could not find user with id(1)');
    }
  })
}

function renderUser(user){
  var userDetailsTemplate = $('#user-details').html();
  var userDetails = $('.user-details');

  userDetails.html(Mustache.render(userDetailsTemplate, user));

}
