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
  $('.vote-against').click(function() {
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