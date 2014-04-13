jQuery ->
  if $('#with-button').size() > 0
    $('.pagination').hide()
    loading_comments = false

    $('#load_more_comments').show().click ->
      unless loading_comments
        loading_comments = true
        more_comments_url = $('.pagination .next_page a').attr('href')
        $this = $(this)
        $this.html('<div class="spinning_logo"><a href="/" id="spin">©</a></div>').addClass('disabled')
        $.getScript more_comments_url, ->
          $this.text('Еще').removeClass('disabled') if $this
          loading_comments = false
      return