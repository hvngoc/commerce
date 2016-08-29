$(document).ready(function () {
  'use strict';
  $('.images img').click(function (evt) {
    evt.preventDefault();
    var imgPath = $(this).attr('src');
    var oldImg = $('#photo img');
    var newImg = $('<img src="' + imgPath + '">');
    newImg.hide();

    $('#photo').prepend(newImg);
    newImg.fadeIn(1000);
    oldImg.fadeOut(1000, function () {
      $(this).remove();
    });
  });

  var scroller = $('#scroller div.innerScrollArea');
  var scrollerContent = scroller.children('ul');
  scrollerContent.children().clone().appendTo(scrollerContent);
  var curX = 0;
  scrollerContent.children().each(function () {
    var $this = $(this);
    $this.css('left', curX);
    curX += $this.outerWidth(true);
  });
  var fullW = curX / 2;
  var viewportW = scroller.width();
  var controller = {
    curSpeed: 0,
    fullSpeed: 2
  };
  var $controller = $(controller);
  var tweenToNewSpeed = function (newSpeed, duration) {
    if (duration == undefined) {
      duration = 600;
    }
    $controller.stop(true).animate({
      curSpeed: newSpeed
    }, duration);
  }
  scroller.hover(function () {
    tweenToNewSpeed(0);
  }, function () {
    tweenToNewSpeed(controller.fullSpeed);
  });

  var doScroll = function () {
    var curX = scroller.scrollLeft();
    var newX = curX + controller.curSpeed;
    if (newX > fullW * 2 - viewportW) {
      newX -= fullW;
    }
    scroller.scrollLeft(newX);
  }
  setInterval(doScroll, 20);
  tweenToNewSpeed(controller.fullSpeed);


  //  var images = $('#scroller ul').clone().find('li');
  //  $('#scroller ul').endlessScroll({
  //    pagesToKeep: 5,
  //    inflowPixels: 100,
  //    fireDelay: 10,
  //    content: function (i, p, d) {
  //      var last_img = $('#scroller li:last');
  //      return images[3].outerHTML;
  //    }
  //  });
});