// var btn = $('button'); // getElementsByTagName
// console.log(btn);
// class이름으로 선택할때
// $('.className') == document.getElementsByClassName
// $('#id') == document.getElementById
// $('HTMLtag') == document.getElementsByTagName
$(document).ready(function() { // == $(function() {

// 1. 버튼을 클릭하면
// 1-1. 버튼을 찾아서
  var btn = $('.change-title');
// 1-2. 클릭 이벤트 리스너를 달아준다.
  btn.on('click', function() {
    alert("버튼누름!");
    var str = prompt("제목을 뭘로 바꿀까?");
    // 2. title에 해당하는 부분을 찾아서
    // 3. 내가 입력한 문자열로 바꿔준다.
    $('.title').text(str);
  });


});
