$(function(){

  function addAuthor(author){
    let html = `
    <div class="book-search">
      <div class="book-search__name">${author.name}</div>
      <div class="book-search__item author__btn--add" data-author-id="${author.id}" data-author-name="${author.name}">追加</div>
    </div>`;
    $('#author-search-result').append(html);
  }

  function addNoAuthor(){
    let html = `
    <div class="book-search">
      <div class="book-search__name">著者が見つかりません</div>
    </div>`;
    $('#author-search-result').append(html);
  }

  // 登録時の著者インクリメンタルサーチ実装部分--bigin--

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
    $('#author_search_field').val(dataId);
    $('.book-search').parent().remove();

  });
  // 登録時の著者インクリメンタルサーチ実装部分--end--
});

