$(function(){

  function buildHTML(j){
    if ( j.content ) {
      var html =
       `<div class="message">
          <div class="takerface">
            <img src=${"https://imgc.eximg.jp/i=https%253A%252F%252Fs.eximg.jp%252Fexnews%252Ffeed%252FRen_ai%252FRen_ai_188420_6aed_1.jpg,zoom=600,quality=70,type=jpg"} >
          </div>
          <div class="contents">
            <div class="takername">
              ${j.user_name + " さんへ"}
            </div>
            <div class="letter">
              <p class="lower-message__content">
                ${j.content}
              </p>
            </div>
            <div class="credo">
              ＃仕事好き ＃親身心 ＃人生を変える
            </div>

            <div class="like">
              <a href="users/${j.user_id}/messages/${j.message_id}/likes" data-method="post">
                <i class="far fa-heart like-btn">
                </i>
              </a>
              ${j.like_count}
            </div>
          </div>

          <div class="message__date">
            ${j.created_at}
          </div>
          <div class="more">
            <ul class="more_list">
              <li>
                <a href="users/${j.user_id}/messages/${j.message_id}/edit">編集</a>
              </li>
              <li>
                <a href="users/${j.user_id}/messages/${j.message_id}" data-method="delete">削除</a>
              </li>
            </ul>
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