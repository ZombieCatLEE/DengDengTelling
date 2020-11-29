$(document).ready(function(){
    //아코디언 메뉴
    var menu = $('.menu');
    var menuA = menu.find('a');
    var menuUl = menu.find('ul');
    close();
    
    menuA.click(function(){
        var ma = $(this);
        var mul = ma.next();
        open(mul);
    });
    function close(){
        menuUl.addClass('close');
    }
    function open(a){
        a.removeClass('close');
    }
});

