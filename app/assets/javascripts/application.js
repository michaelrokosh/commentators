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
//= require bootstrap/modal
//= require bootstrap/transition

$(document).ready(function(){
    // Variables
    var objMain = $('#desktop');
 
    // Show sidebar
    function showSidebar(){
        objMain.addClass('use-sidebar');
    }
 
    // Hide sidebar
    function hideSidebar(){
        objMain.removeClass('use-sidebar');
    }
 
    // Sidebar separator
    var objSeparator = $('#separator');
 
    objSeparator.click(function(e){
        e.preventDefault();
        if ( objMain.hasClass('use-sidebar') ){
            hideSidebar();
        }
        else {
            showSidebar();
        }
    });
 
});

$("#modal-window").html("<%= escape_javascript(render 'modals/add') %>");

$(function() {
  $('.godnota').click(function() {
    $button = $(this)
    if ( $( ".godnota" ).hasClass( "dniwe" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/godnota',
        success: function() {
          $(".godnota").removeClass('dniwe').addClass('godno').html('OK'); ;
        }
      })
    }
  });
});

//post votes
$(function() {
  $(document).on( "click", ".post-vote-against", function() {
    $button = $(this)
    if ( $( "#post-vote-block-" + $button.attr('data-post-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/vote_down',
        success: function() {
          var rating = parseInt($button.attr('data-post-rating')) - 1
          $("#post-vote-block-" + $button.attr('data-post-id')).removeClass('make-vote').addClass('vote-made').html('<div class="post-vote-block"><div class="post-voted-against">-</div><div class="post-rating">' + rating + '</div></div>'); ;
        }
      })
    }
  });
});

$(function() {
  $(document).on( "click", ".post-vote-for", function() {
    $button = $(this)
    if ( $( "#post-vote-block-" + $button.attr('data-post-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/vote_up',
        success: function() {
          var rating = parseInt($button.attr('data-post-rating')) + 1
          $("#post-vote-block-" + $button.attr('data-post-id')).removeClass('make-vote').addClass('vote-made').html('<div class="post-vote-block"><div class="post-voted-for">+</div><div class="post-rating">' + rating + '</div></div>'); ; 
        }
      })
    }
  });
});

// comment votes
$(function() {
  $(document).on( "click", ".vote-against", function() {
    $button = $(this)
    $comment_id = ".comment_" + $button.attr('data-comment-id')
    if ( $( "#vote-block-" + $button.attr('data-comment-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_down',
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
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_up',
        success: function() {
          var rating = parseInt($button.attr('data-comment-rating')) + 1
          $("#vote-block-" + $button.attr('data-comment-id')).removeClass('make-vote').addClass('vote-made').html('<div class="vote-block"><div class="rating">' + rating + '</div><div class="voted"><i class="voted-against fa fa-thumbs-up green"></i></div></div>'); ; 
        }
      })
    }
  });
});

// mobile version
$(function() {
  $(document).on( "click tap touchstart", ".vote-down", function() {
    $button = $(this)
    $comment_id = ".comment_" + $button.attr('data-comment-id')
    if ( $( "#vote-block-" + $button.attr('data-comment-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_down',
        success: function() {
          var rating = parseInt($button.attr('data-comment-rating')) - 1
          $("#vote-block-" + $button.attr('data-comment-id')).removeClass('make-vote').addClass('vote-made').html('<div class="vote-block"><div class="rating">' + rating + '</div></div>'); ;
        }
      })
    }
  });
});

$(function() {
  $(document).on( "click tap touchstart", ".vote-up", function() {
    $button = $(this)
    if ( $( "#vote-block-" + $button.attr('data-comment-id')).hasClass( "make-vote" ) ) {
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/comments/' + $button.attr('data-comment-id') + '/vote_up',
        success: function() {
          var rating = parseInt($button.attr('data-comment-rating')) + 1
          $("#vote-block-" + $button.attr('data-comment-id')).removeClass('make-vote').addClass('vote-made').html('<div class="vote-block"><div class="rating">' + rating + '</div></div>'); ; 
        }
      })
    }
  });
});

//mobile v end

//counter

$(document).ready(function(){
  var limitnum = 99; // set your int limit for max number of characters
  
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


  $('#comment-field').keyup(function(){
    limiting($(this), limitnum);
  });
});

//post votes admin
$(function() {
  $(document).on( "click", ".post-vote-against-admin", function() {
    $button = $(this)
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/vote_down',
        success: function() {
          var rating = parseInt($("#post-rating-admin-block-" + $button.attr('data-post-id')).text()) - 1
          $("#post-rating-admin-block-" + $button.attr('data-post-id')).html(rating); ;
        }
      })
  });
});

$(function() {
  $(document).on( "click", ".post-vote-for-admin", function() {
    $button = $(this)
      $.ajax({
        type: "POST",
        url: '/' + $button.attr('data-type') + '/' + $button.attr('data-post-id') + '/vote_up',
        success: function() {
          var rating = parseInt($("#post-rating-admin-block-" + $button.attr('data-post-id')).text()) + 1
          $("#post-rating-admin-block-" + $button.attr('data-post-id')).html(rating); ; 
        }
      })
  });
});