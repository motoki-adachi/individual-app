$(function(){

  function addAuthor(author){
    let html = `
    <div class="test-contents">
      <div class="books-form__contents">${author.name}</div>
      <div class="author-search-add author__btn--add" data-author-id="${author.id}" data-author-name="${author.name}">追加</div>
    </div>`;
    $('#author-search-result').append(html);
  }

  function addNoAuthor(){
    let html = `<div class=".books-form__contents">ユーザーが見つかりません</div>`;
    $('#author-search-result').append(html);
  }


  // function addToUser(name, id){
  //   let html = `<div class="chat-group-user clearfix" id="${id}">
  //                 <p class="chat-group-user__name">${name}</p>
  //                 <div class="user-search-add chat-group-user__btn chat-group-user__btn--remove" data-user-id="${id}" data-user-name="${name}">削除</div>
  //               </div>`;
  //   $('#chat-group-users').append(html);
  // }

  // function addMember(dataId) {
  //   let html = `<input value="${dataId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${dataId}" />`;
  //   $(`#${dataId}`).append(html);
  // }




  $('#author_search_field').on('keyup', function(){
    let input = $('#author_search_field').val();
    $.ajax({
      type: "GET",
      url: "/books/top",
      data: { keyword: input },
      dataType: "json"
        })
    .done(function(authors) {
      $('#author-search-result').empty();
      if (authors.length !== 0) {
        authors.forEach(function(author) {
          addAuthor(author);
        })
      } else if (input.length == 0) {
        return false;
      } else {
        addNoAuthor();
      }
    })  
    .fail(function() {
      console.log("error");
    });
  });

  $(document).on('click', '.author__btn--add', function(){

    let dataId = $(this).attr('data-author-id');
    let dataName = $(this).attr('data-author-name');
    $(this).parent().remove();
    $('#author_search_field').val(dataId);
  });

});

