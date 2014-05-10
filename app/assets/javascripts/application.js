// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require application
//= require pagination

$(function() {
  $('.godnota').click(function() {
    $button = $(this)
    if ( $( ".godnota" ).hasClass( "dniwe" ) ) {
      $.ajax({
        type: "POST",
        url: '/images/' + $button.attr('data-image-id') + '/godnota',
        success: function() {
          $(".godnota").removeClass('dniwe').addClass('godno').html('OK'); ;
        }
      })
    }
  });
});


$(function() {
  $(document).on( "click", ".vote-against", function() {
    $button = $(this)
    $comment_id = ".comment_" + $button.attr('data-comment-id')
    if ( $( "#vote-block-" + $button.attr('data-comment-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/images/' + $button.attr('data-image-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_down',
        success: function() {
          var rating = parseInt($button.attr('data-comment-rating')) - 1
          $("#vote-block-" + $button.attr('data-comment-id')).removeClass('make-vote').addClass('vote-made').html('<div class="vote-block"><div class="rating">' + rating + '</div><div class="voted"><i class="voted-against fa fa-thumbs-down red"></i></div></div>'); ;
        }
      })
    }
  });
});

$(function() {
  $(document).on( "click", ".vote-for", function() {
    $button = $(this)
    if ( $( "#vote-block-" + $button.attr('data-comment-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/images/' + $button.attr('data-image-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_up',
        success: function() {
          var rating = parseInt($button.attr('data-comment-rating')) + 1
          $("#vote-block-" + $button.attr('data-comment-id')).removeClass('make-vote').addClass('vote-made').html('<div class="vote-block"><div class="rating">' + rating + '</div><div class="voted"><i class="voted-for fa fa-thumbs-up green"></i></div></div>'); ; 
        }
      })
    }
  });
});


//counter

$(document).ready(function(){
  var limitnum = 120; // set your int limit for max number of characters
  
  function limiting(obj, limit) {
    var cnt = $("#counter > span");
    var txt = $(obj).val(); 
    var len = txt.length;
    
    // check if the current length is over the limit
    if(len > limit){
       $(obj).val(txt.substr(0,limit));
       $(cnt).html(len-1);
     } 
     else { 
       $(cnt).html(len);
     }
     
     // check if user has less than 20 chars left
     if(limit-len <= 20) {
      $(cnt).addClass("warning");
     }
  }


  $('textarea').keyup(function(){
    limiting($(this), limitnum);
  });
});