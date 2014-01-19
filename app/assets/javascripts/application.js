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
$(function() {
  $('.vote-against').click(function() {
    $button = $(this)
    if ( $( ".votes" ).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/images/' + $button.attr('data-image-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_down',
        success: function() {
          $button.removeClass('make-vote').addClass('vote-made').html("<span> Голос принят!</span>"); ; 
        }
      })
    }
  });
});

$(function() {
  $('.vote-for').click(function() {
    $button = $(this)
    if ( $( ".votes" ).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/images/' + $button.attr('data-image-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_up',
        success: function() {
          $button.removeClass('make-vote').addClass('vote-made').html("<span> Голос принят!</span>"); ; 
        }
      })
    }
  });
});