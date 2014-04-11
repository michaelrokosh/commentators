jQuery ->
  if $('#with-button').size() > 0
    $('.pagination').hide()
    loading_comments = false

    $('#load_more_comments').show().click ->
      unless loading_comments
        loading_comments = true
        more_comments_url = $('.pagination .next_page a').attr('href')
        $this = $(this)
        $this.html('<img src="/ajax-loader.gif" alt="Loading..." title="Loading..." />').addClass('disabled')
        $.getScript more_comments_url, ->
          $this.text('More comments').removeClass('disabled') if $this
          loading_comments = false
      return