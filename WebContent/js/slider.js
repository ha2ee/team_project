/*// 메인화면 - 캐러셀

$(function() {
  var winW = cnt = setId = 0;
  resizeFn();

  function resizeFn() {
    winW = $(window).innerWidth();
    $(".slide").css({
      width: winW
    });
  };

  $(window).resize(function() {
    resizeFn();
  });

  autoplayFn();

  function autoplayFn() {
    setId = setInterval(nextCountFn, 3500);
  };

  $(".pageBt").each(function(idx) {
    $(this).click(function() {
      clearInterval(setId);
      cnt = idx;
      mainslideFn();
    });
  });

  function nextCountFn() {
    cnt++;
    mainslideFn();
  };

  function prevCountFn() {
    cnt--;
    mainslideFn();
  };

  function mainslideFn() {
    $(".slideWrap").stop().animate({
      left: (-100 * cnt) + "%"
    }, 600, function() {
      if (cnt > 3) {
        cnt = 0;
      }
      if (cnt < 0) {
        cnt = 3
      }
      $(".slideWrap").stop().animate({
        left: (-100 * cnt) + "%"
      }, 0)
    });
    $(".pageBt").removeClass("addPageBt");
    $(".pageBt").eq(cnt > 3 ? cnt = 0 : cnt).addClass("addPageBt");
  };
});*/


// trainer.jsp에 있는 캐러셀

$('.owl-carousel').owlCarousel({
    loop:true,
    margin:0,
    autoplay:true,
    autoplayTimeout:3000,
    nav:true,
    navText:['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
    responsive:{
        1:{
            items:1
        },
        1:{
            items:3
        },
        1:{
            items:1
        }
    }
})



