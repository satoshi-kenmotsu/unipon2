$(function(){

  function buildHTML(m){
    if ( m.content ) {
      var html =
       `<div class="message">
          <div class="takerface">
            <img src=${"https://imgc.eximg.jp/i=https%253A%252F%252Fs.eximg.jp%252Fexnews%252Ffeed%252FRen_ai%252FRen_ai_188420_6aed_1.jpg,zoom=600,quality=70,type=jpg"} >
          </div>
          <div class="contents">
            <div class="takername">
              ${m.user_name + " さんへ"}
            </div>
            <div class="letter">
              <p class="lower-message__content">
                ${m.content}
              </p>
            </div>
            <div class="credo">
              ＃仕事好き ＃親身心 ＃人生を変える
            </div>
            <div class="like">
              ${m.like_count}
            </div>
          </div>

          <div class="message__date">
            ${m.created_at}
          </div>
        </div>`
      return html;
    }
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,  //同期通信でいう『パス』
      type: 'POST',  //同期通信でいう『HTTPメソッド』
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('form')[0].reset();
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});
      $(".form__submit").removeAttr("disabled");
    })

    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });

  })
});