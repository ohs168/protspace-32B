// var $heart = $("#like-button img");
// $("#like-button").on("click", function(){
//   var $likeSum = $("#like-sum")
//   like_function( $(this), $heart, $likeSum)
//   console.log(this)
// });

// function like_function(id, button, heart, sum) {
//   if (button.hasClass("decrement")){
//       $.ajax({url: "/likes/" + id, type: "delete", data: {prototype_id: id, dataType: "json"}})
//       .done(function(data){
//       button.removeClass("decrement").addClass("increment")
//       heart.attr("src", "/assets/icon_heart.svg")
//       sum.text(data["count"])
//       })
//     }else{
//       $.ajax({url: "/likes", type: "post", data: {prototype_id: id, dataType: "json"}})
//       .done(function(data){
//       button.removeClass("increment").addClass("decrement")
//       heart.attr("src", "/assets/icon_heart_red.svg")
//       sum.text(data["count"])
//       })
//     }
// }
