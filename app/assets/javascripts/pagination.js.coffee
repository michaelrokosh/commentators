jQuery ->
  if $('#with-button').size() > 0
    $('.pagination').hide()
    loading_comments = false

    $('#load_more_comments').show().click ->
      unless loading_comments
        loading_comments = true
        more_comments_url = $('.pagination .next_page a').attr('href')
        $this = $(this)
        $this.html('<img src="/ajax-loader.gif" alt="Темный властелин подгружает комментарии..." title="Темный властелин подгружает комментарии..." />').addClass('disabled')
        $.getScript more_comments_url, ->
          $this.text('Еще').removeClass('disabled') if $this
          loading_comments = false
      return