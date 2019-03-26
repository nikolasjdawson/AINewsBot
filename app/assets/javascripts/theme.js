// js Document

    // Created on   : 26/02/2019.
    // Theme Name   : Rogan - Creative Multi-Purpose HTML Template.
    // Version      : 1.0.
    // Author       : Creativegigs.
    // Developed by : Jubayer al hasan. (me@heloshape.com)

// document.addEventListener("turbolinks:load", function() {
// $(document).on "turbolinks:load", -
// (function($) {
    // "use strict";


    $(document).on ("turbolinks:load", function (){

        $.fn.visible = function(partial) {
            var $t            = $(this),
                $w            = $(window),
                viewTop       = $w.scrollTop(),
                viewBottom    = viewTop + $w.height(),
                _top          = $t.offset().top,
                _bottom       = _top + $t.height(),
                compareTop    = partial === true ? _bottom : _top,
                compareBottom = partial === true ? _top : _bottom;

          return ((compareBottom <= viewBottom) && (compareTop >= viewTop));
        };

        /* scroll animate
        -------------------------------------------------------*/
        var links = $('a.scroll-target');
        links.on('click', function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
            var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top - 75,
                    }, 1000);
                    return false;
                }
            }
        });

        // ------------------------- Tooltips
        $('[data-toggle="tooltip"]').tooltip();


        // -------------------- Subscribe newsletter
        if($(".ajax-sub-form").length){
          $('.ajax-sub-form').ajaxChimp();
        }

        // --------------------- SVG convert Function
        $('img.svg').each(function(){
        var $img = $(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');

        $.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = $(data).find('svg');

            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Check if the viewport is set, else we gonna set it if we can.
            if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
                $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'))
            }

            // Replace image with new SVG
            $img.replaceWith($svg);

            }, 'xml');

        });

        // -------------------------- Sidebar Menu/E-commerce
        var subMenu = $ (".main-menu-list ul li.dropdown-holder>a"),
          expender = $ (".main-menu-list ul li.dropdown-holder .expander");

        if ($('.sidebar-menu-open').length) {
          $('.sidebar-menu-open').on('click', function () {
            $('#sidebar-menu').addClass("show-menu");
          });
        }

        if ($('.close-button').length) {
          $('.close-button').on('click', function () {
            $('#sidebar-menu').removeClass("show-menu");
          });
        }
        subMenu.on("click", function (e) {
            e.preventDefault();
        });

        subMenu.append(function () {
          return '<button type="button" class="expander"><i class="fa fa-chevron-down" aria-hidden="true"></i></button>';
        });

        subMenu.on('click', function () {
          if ( $(this).parent('li').children('ul').hasClass('show') ) {
              $(this).parent('li').children('ul').removeClass('show');
          } else {
              $('.sub-menu.show').removeClass('show');
              $(this).parent('li').children('ul').addClass('show');
          }
       });

        // ------------------------ Product Quantity Selector
        if ($(".product-value").length) {
            $('.value-increase').on('click',function(){
              var $qty=$(this).closest('ul').find('.product-value');
              var currentVal = parseInt($qty.val());
              if (!isNaN(currentVal)) {
                  $qty.val(currentVal + 1);
              }
          });
          $('.value-decrease').on('click',function(){
              var $qty=$(this).closest('ul').find('.product-value');
              var currentVal = parseInt($qty.val());
              if (!isNaN(currentVal) && currentVal > 1) {
                  $qty.val(currentVal - 1);
              }
          });
        }


        // ------------------------ eCommerce Banner
          //Function to animate slider captions
          function doAnimations(elems) {
            //Cache the animationend event in a variable
            var animEndEv = "webkitAnimationEnd animationend";

            elems.each(function() {
              var $this = $(this),
                $animationType = $this.data("animation");
              $this.addClass($animationType).one(animEndEv, function() {
                $this.removeClass($animationType);
              });
            });
          }

          //Variables on page load
          var $myCarousel = $("#eCommerce-carousel"),
            $firstAnimatingElems = $myCarousel
              .find(".carousel-item:first")
              .find("[data-animation ^= 'animated']");

          //Initialize carousel
          $myCarousel.carousel();

          //Animate captions in first slide on page load
          doAnimations($firstAnimatingElems);

          //Other slides to be animated on carousel slide event
          $myCarousel.on("slide.bs.carousel", function(e) {
            var $animatingElems = $(e.relatedTarget).find(
              "[data-animation ^= 'animated']"
            );
            doAnimations($animatingElems);
          });


        // ------------------------- Price Ranger
        if ($('.price-ranger').length) {
          $( '.price-ranger #slider-range' ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 0, 335 ],
            slide: function( event, ui ) {
              $( '.price-ranger .ranger-min-max-block .min' ).val( '$' + ui.values[ 0 ] );
              $( '.price-ranger .ranger-min-max-block .max' ).val( '$' + ui.values[ 1 ] );
            }
          });
            $( '.price-ranger .ranger-min-max-block .min' ).val( '$' + $( '.price-ranger #slider-range' ).slider( 'values', 0 ) );
          $( '.price-ranger .ranger-min-max-block .max' ).val( '$' + $( '.price-ranger #slider-range' ).slider( 'values', 1 ) );
        }


        // ------------------------ Product Fliter
        if($(".filter-button").length) {
          $(".filter-button").on('click', function() {
              $('.large-filter-content').toggleClass('show-content');
              $('.filter-button').toggleClass('open');
          });
        }

        // ---------------------------- Select Dropdown
        // if($('select').length) {
        //   $('.theme-select-menu').selectize();
        // }


        // ------------------------ Navigation Scroll
        $(window).on('scroll', function (){
          var sticky = $('.theme-main-menu'),
          scroll = $(window).scrollTop();
          if (scroll >= 100) sticky.addClass('fixed');
          else sticky.removeClass('fixed');

        });

        // -------------------- Remove Placeholder When Focus Or Click
        $("input,textarea").each( function(){
            $(this).data('holder',$(this).attr('placeholder'));
            $(this).on('focusin', function() {
                $(this).attr('placeholder','');
            });
            $(this).on('focusout', function() {
                $(this).attr('placeholder',$(this).data('holder'));
            });
        });

        // -------------------- From Bottom to Top Button
            //Check to see if the window is top if not then display button
        $(window).on('scroll', function (){
          if ($(this).scrollTop() > 200) {
            $('.scroll-top').fadeIn();
          } else {
            $('.scroll-top').fadeOut();
          }
        });


        //---------------------- Click event to scroll to top
        $('.scroll-top').on('click', function() {
          $('html, body').animate({scrollTop : 0},1500);
          return false;
        });


        // ----------------------------- Counter Function
        var timer = $('.timer');
        if(timer.length) {
            timer.appear(function () {
              timer.countTo();
          });
        }

        // ------------------------ Hover Tilt effect
        var tiltBlock = $('.js-tilt');
          if(tiltBlock.length) {
            $('.js-tilt').tilt({
                glare: true,
                maxGlare: 0.4
            });
        }


        // ----------------------- Progress Bar
        $('.progress-bar').each(function(){
            var width = $(this).data('percent');
            $(this).css({'transition': 'width 3s'});
            $(this).appear(function() {
                console.log('hello');
                $(this).css('width', width + '%');
                $(this).find('.count').countTo({
                    from: 0,
                    to: width,
                    speed: 3000,
                    refreshInterval: 50,
                });
            });
        });



        // --------------------------- Theme Main Banner Slider One
        var banner = $(".banner-one");
        if (banner.length) {
          banner.camera({ //here I declared some settings, the height and the presence of the thumbnails
            height: '940px',
            pagination: false,
            navigation: false,
            thumbnails: false,
            playPause: false,
            pauseOnClick: false,
            autoPlay:true,
            hover: false,
            overlayer: true,
            loader: 'none',
            minHeight: '400px',
            time: 6000000,
          });
        }



        // ------------------------------- Gallery Slider
        var tSlider = $ (".gallery-slider");
        if(tSlider.length) {
            tSlider.owlCarousel({
              loop:true,
              nav:true,
              navText: ["<i class='flaticon-back'></i>" , "<i class='flaticon-next'></i>"],
              dots:false,
              autoplay:true,
              autoplayTimeout:4000,
              smartSpeed:1200,
              autoplayHoverPause:true,
              lazyLoad:true,
              responsive:{
                    0:{
                        items:1
                    },
                    600:{
                        items:2
                    },
                    1100:{
                        items:3
                    },
                    1550:{
                        items:4,
                    }
                },
          });
        }


        // ------------------------------- Testimonial Slider
        var agnTslider = $ (".agn-testimonial-slider");
        if(agnTslider.length) {
            agnTslider.owlCarousel({
              loop:true,
              nav:true,
              navText: ["<i class='flaticon-back'></i>" , "<i class='flaticon-next'></i>"],
              dots:false,
              autoplay:true,
              autoplayTimeout:4000,
              smartSpeed:1200,
              autoplayHoverPause:true,
              lazyLoad:true,
              items:1
          });
        }


        // ------------------------------- Home Blog Slider
        var nSlider = $ (".blog-one-slider");
        if(nSlider.length) {
            nSlider.owlCarousel({
              loop:true,
              nav:false,
              dots:false,
              autoplay:true,
              margin:30,
              autoplayTimeout:4000,
              smartSpeed:1200,
              autoplayHoverPause:true,
              lazyLoad:true,
              responsive:{
                    0:{
                        items:1
                    },
                    768:{
                        items:2
                    },
                    992:{
                        items:3,
                    }
                },
          });
        }



        // ------------------------------ Partner Logo Footer
        var logoslider = $ (".partner-slider");
          if(logoslider.length) {
              logoslider.owlCarousel({
                loop:true,
                nav:false,
                dots:false,
                autoplay:true,
                autoplayTimeout:4000,
                autoplaySpeed:1000,
                lazyLoad:true,
                singleItem:true,
                center:true,
                responsive:{
                    0:{
                        items:1
                    },
                    550:{
                        items:3
                    },
                    992:{
                        items:5
                    }
                }
            });
          }



        // ------------------------------ Customer Slider
        var csSlider = $ (".customer-slider");
          if(csSlider.length) {
              csSlider.owlCarousel({
                loop:true,
                nav:true,
                navText: ["<i class='flaticon-back'></i>" , "<i class='flaticon-next'></i>"],
                dots:false,
                autoplay:true,
                margin:0,
                autoplayTimeout:4500,
                autoplaySpeed:1000,
                lazyLoad:true,
                singleItem:true,
                responsive:{
                    0:{
                        items:1
                    },
                    768:{
                        items:2
                    },
                    992:{
                        items:3
                    }
                }
            });
          }



          // ------------------------------ Related Product Slider
          var reSlider = $ (".related-product-slider");
            if(reSlider.length) {
                reSlider.owlCarousel({
                  loop:true,
                  nav:true,
                  navText: ["<i class='fa fa-angle-left'></i>" , "<i class='fa fa-angle-right'></i>"],
                  dots:false,
                  autoplay:true,
                  margin:30,
                  autoplayTimeout:4500,
                  autoplaySpeed:1000,
                  lazyLoad:true,
                  responsive:{
                      0:{
                          items:1
                      },
                      576:{
                          items:2
                      },
                      992:{
                          items:3
                      }
                  }
              });
            }


            // ------------------------ Minimal Project Slider
              var mcpSlider = $ (".project-minimal-slider");
                if(mcpSlider.length) {
                    mcpSlider.owlCarousel({
                      loop:true,
                      nav:true,
                      navText: ["<i class='flaticon-back'></i>" , "<i class='flaticon-next'></i>"],
                      dots:false,
                      autoplay:true,
                      margin:45,
                      autoplayTimeout:4500,
                      autoplaySpeed:1000,
                      lazyLoad:true,
                      singleItem:true,
                      center:true,
                      responsive:{
                          0:{
                              items:1
                          },
                          768:{
                              items:2
                          },
                          1200:{
                              items:3
                          }
                      }
                  });
                }



            // ------------------------------ Team Classic Slider
            var tcSlider = $ (".team-classic-slider");
              if(tcSlider.length) {
                  tcSlider.owlCarousel({
                    loop:true,
                    nav:false,
                    dots:false,
                    autoplay:true,
                    margin:30,
                    autoplayTimeout:4500,
                    autoplaySpeed:1000,
                    lazyLoad:true,
                    singleItem:true,
                    responsive:{
                        0:{
                            items:1
                        },
                        550:{
                            items:2
                        },
                        992:{
                            items:3
                        }
                    }
                });
              }

                // --------------------------------- Contact Form
                // init the validator
                // validator files are included in the download package
                // otherwise download from http://1000hz.github.io/bootstrap-validator

                if($("#contact-form").length) {
                  $('#contact-form').validator();
                  // when the form is submitted
                  $('#contact-form').on('submit', function (e) {

                      // if the validator does not prevent form submit
                      if (!e.isDefaultPrevented()) {
                          var url = "inc/contact.php";

                          // POST values in the background the the script URL
                          $.ajax({
                              type: "POST",
                              url: url,
                              data: $(this).serialize(),
                              success: function (data)
                              {
                                  // data = JSON object that contact.php returns

                                  // we recieve the type of the message: success x danger and apply it to the
                                  var messageAlert = 'alert-' + data.type;
                                  var messageText = data.message;

                                  // let's compose Bootstrap alert box HTML
                                  var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';

                                  // If we have messageAlert and messageText
                                  if (messageAlert && messageText) {
                                      // inject the alert to .messages div in our form
                                      $('#contact-form').find('.messages').html(alertBox);
                                      // empty the form
                                      $('#contact-form')[0].reset();
                                  }
                              }
                          });
                          return false;
                      }
                  });
                }


          // -------------------------------- Accordion Panel
          if ($('.theme-accordion > .panel').length) {
            $('.theme-accordion > .panel').on('show.bs.collapse', function (e) {
                  var heading = $(this).find('.panel-heading');
                  heading.addClass("active-panel");

            });
            $('.theme-accordion > .panel').on('hidden.bs.collapse', function (e) {
                var heading = $(this).find('.panel-heading');
                  heading.removeClass("active-panel");
                  //setProgressBar(heading.get(0).id);
            });
            $('.panel-heading a').on('click',function(e){
                if($(this).parents('.panel').children('.panel-collapse').hasClass('show')){
                    e.stopPropagation();
                }
            });
          }






    }); //End Window Ready Function


    $(window).on ('load', function (){ // makes sure the whole site is loaded

        // -------------------- Site Preloader
        $('#ctn-preloader').fadeOut(); // will first fade out the loading animation
        $('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
        $('body').delay(350).css({'overflow':'visible'});


        // ------------------------------- AOS Animation
        if ($("[data-aos]").length) {
            AOS.init({
            duration: 1000,
            mirror: true
          });
        }

        // ------------------------------- WOW Animation
        if ($(".wow").length) {
            var wow = new WOW({
            boxClass:     'wow',      // animated element css class (default is wow)
            animateClass: 'animated', // animation css class (default is animated)
            offset:       20,          // distance to the element when triggering the animation (default is 0)
            mobile:       true,       // trigger animations on mobile devices (default is true)
            live:         true,       // act on asynchronously loaded content (default is true)
          });
          wow.init();
        }

        // ----------------------------- isotop gallery
        if ($("#isotop-gallery-wrapper , .masnory-blog-wrapper").length) {
            var $grid = $('#isotop-gallery-wrapper , .masnory-blog-wrapper').isotope({
              // options
              itemSelector: '.isotop-item',
              percentPosition: true,
              masonry: {
                // use element for option
                columnWidth: '.grid-sizer'
              }

            });

            // filter items on button click
            $('.isotop-menu-wrapper').on( 'click', 'li', function() {
              var filterValue = $(this).attr('data-filter');
              $grid.isotope({ filter: filterValue });
            });

             // change is-checked class on buttons
              $('.isotop-menu-wrapper').each( function( i, buttonGroup ) {
                var $buttonGroup = $( buttonGroup );
                $buttonGroup.on( 'click', 'li', function() {
                  $buttonGroup.find('.is-checked').removeClass('is-checked');
                  $( this ).addClass('is-checked');
                });
              });
        }


          // ------------------------------------- Fancybox
        var fancy = $ (".fancybox");
        if(fancy.length) {
          fancy.fancybox({
            arrows: true,
            buttons: [
              "zoom",
              //"share",
              "slideShow",
              //"fullScreen",
              //"download",
              "thumbs",
              "close"
            ],
            animationEffect: "zoom-in-out",
            transitionEffect: "zoom-in-out",
          });
        }



    });  //End On Load Function


    $(window).on ('scroll', function (){ // makes sure the whole site is loaded

        // --------------------- Viewport Animation
        $(".hide-pr").each(function(i, el) {
          var el = $(el);
          if (el.visible(true)) {
            el.addClass("show-pr");
          } else {
            el.removeClass("show-pr");
          }
        });

    });  //End On Scroll Function



// })(jQuery);
