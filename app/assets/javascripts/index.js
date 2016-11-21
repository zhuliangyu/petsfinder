// // var DOMAIN = "http://localhost:3000";
// var DOMAIN = "https://blooming-cove-82899.herokuapp.com/";
//
//
// $(function() {
//   imageUpload();
//   setup();
//   populateMain();
//   petSighting();
//   signup();
// });
//
// var setup = function() {
//   // Menu selector
//   $('li a').on('click', function() {
//     var id = $(this).attr('id');
//     var backId = $(this).parents('section').attr('id');
//     $(this).parents('section').hide();
//     $('section#'+id).show();
//     $('.back-button').attr('id',backId);
//     console.log(id);
//   });
//
//   // Back selector
//   // sets home as default, temp. fix for 3 levels of menus
//   // ex. Home > lost-pet > ;lst-form
//   $('.back-button').on('click', function() {
//     var id = $(this).attr('id');
//     $(this).parents('section').hide();
//     $('section#'+id).show();
//     $(this).attr('id', 'home');
//   });
//
//   $('#welcome').on('click', function(){
//     $('main').fadeOut(100);
//     $('section#welcome-page').fadeIn(100);
//   });
// };
//
// var populateMain = function() {
//   var petList = $('.pet-list');
//   //getPet(1);
//   getPets();
// };
//
// // Pet sighting show page
// var petSighting = function() {
//   getPet(1);
//   $('#target-sightings').on('submit', function() {
//     getPet(1);
//   });
// };
//
// function getPets () {
//   $.ajax({
//     // url: `${DOMAIN}/pets.json`, //<<
//     url: `${DOMAIN}/pets.json`, //<<
//     success: function (pets) {
//       renderPets(pets);
//     },
//     error: function () {
//       alert('Could not load pets, please try again...');
//     }
//   });
// }
//
// function renderPets (pets) {
//   var petTemplate = $('#pet-list').html();
//   var petList = $('.pet-listing');
//   Mustache.parse(petTemplate);
//
//   var petsHTML = pets
//     .map(function (pet) {
//       return Mustache.render(petTemplate, pet);
//     }).join('');
//   petList.html(petsHTML);
// }
//
// function getPet (id) {
//   $.ajax({
//     url: `${DOMAIN}/pets/${id}.json`,//<<
//     success: function (pet) {
//       renderPet(pet);
//     },
//     error: function () {
//       alert(`Could not find pet with id(${id}), please try again...`)
//     }
//   })
// }
//
// function renderPet (pet) {
//   var petDetailsTmpl = $('#pet-details').html();
//   var petDetails = $('.pet-details');
//
//   petDetails.html(Mustache.render(petDetailsTmpl, pet));
// }
//
//
// // function deletePet (id) {
// //   $.ajax({
// //     url: `${DOMAIN}/pets/${id}.json`,
// //     type: 'DELETE', //<< include error
// //     success: function () {
// //       console.log("good!!");
// //     }
// //   });
// // }
// //
//
// function createPet() {
//   $.post(
//   DOMAIN + '/pets.json',
//   {
//     pet_type: pet-type,
//     breed: pet-breed,
//     name:  pet-name,
//     sex:   pet-gender,
//     color:  pet-color,
//     age:   pet-age,
//     date_seen: date-time,
//     note:  notes,
//     images: pet-photos,
//     lost:   true,
//     address: last-seen,
//     user_id: current_user
//   });
// }
// //
// // function updatePet (id) {
// //   $.ajax({
// //     url: `${DOMAIN}/pets/${id}.json`,
// //     type: 'patch',
// //     data:{'pet[type]': "A", //<< update
// //           'pet[breed]': "B",
// //           'pet[name]': "C",
// //           'pet[sex]': "D",
// //           'pet[color]': "E",
// //           'pet[age]': "F",
// //           'pet[date_seen]': "G",
// //           'pet[note]': "H",
// //           'pet[images]': "I",
// //           'pet[lost]': "J",
// //           'pet[address]': "K",
// //           'pet[longitude]': "L",
// //           'pet[latitude]': "M"
// //          },
// //     success: function () {
// //         // console.log("good!!"); //<< replace
// //     }
// //   });
// // };
//
// // Image uploader function
// function imageUpload () {
//   $('#target').on('submit', function() {
//     var formData = new FromData(this);
//     // $.ajax({
//     //   url: `${DOMAIN}/pets.json`,
//     //   type:'post',
//     //   data: {}
//     //   success: function (pets) {
//     //     renderPets(pets);
//     //   },
//     //   error: function () {
//     //     alert('Could not load pets, please try again...');
//     //   }
//     // });
//     $.post(`/${DOMAIN}/pets.json`,{data:formData});
//
//
//   });
// }
//
// function signup() {
//   $.post(
//      `${DOMAIN}/users#create`,
//     {
//       first_name: $('signup-first-name').val(),
//       last_name: $('signup-last-name').val(),
//       email: $('signup-form-email').val(),
//       password: $('signup-form-password').val(),
//       password_confirmation: $('signup-form-confirmation').val()
//   });
// }
