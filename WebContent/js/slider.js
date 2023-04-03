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
});

//center.jsp 캐러셀
$('#carousel-example-generic').carousel({
	autoplay:true,
	autoplayTimeout:5000,
	pause: "hover"
  });



