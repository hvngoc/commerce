'use strict';
$(function () {
  $.widget('ui.product_item', {
    options: {
      location: 'bottom',
      backgroundColor: 'rgba(0,0,0,0.5)',
      color: 'white'
    },
    _create: function () {

      var self = this,
        o = self.options,
        el = self.element,

        barStr =
        '<div class="bar" style = "background:rgba(0,0,0,0.5);height:40px; ' +
        'transition:all 0.5s" > ' +
        '<a href="#" >Add to Wishlist</>' +
        '<a href="#" >View Detail</a> </div>',
        magnifyingGlassStr = '<a href="#" style="position:absolute;display:inline-block;width:80px;height:80px;border-radius:50%;visibility:hidden;border: 1px solid white;transition:all 0.5s"><img src="/Images/Static/magnifying-glass.png" style="width:60px; height:60px;padding:20px 0 0 20px;opacity: 1;"></a>',
        bar = $.parseHTML(barStr),
        bar = $(bar),
        magnifyingGlass = $.parseHTML(magnifyingGlassStr),
        magnifyingGlass = $(magnifyingGlass);


      bar.children('a').each(function () {
        $(this).css({
          color: 'white',
          display: 'table-cell',
          textAlign: 'center',
          fontSize: '12px',
          lineHeight: '40px',
          textDecoration: 'none',
          transition: 'all 0.5s'
        });
        $(this).on('mouseover', this, function (e) {
          $(this).css({
            backgroundColor: 'red',
            color: 'green'
          });
        });
        $(this).on('mouseleave', this, function (e) {
          $(this).css({
            backgroundColor: o.backgroundColor,
            color: o.color
          });
        });
      });
      var $image = el.children('img');
      $image.after(bar);
      $image.after(magnifyingGlass);

      var barWidth = el.width() - parseInt(bar.css('paddingLeft')) - parseInt(bar.css('paddingRight')),
        barHeight = bar.outerHeight(true),
        elementBottom = el.height();

      bar.css({
        top: (o.location === 'top') ? 0 : elementBottom,
        left: 0,
        width: barWidth,
        display: 'table',
        backgroundColor: o.backgroundColor,
        color: o.color
      });
      magnifyingGlass.css({
        top: el.height() / 2 - magnifyingGlass.height() / 2,
        left: barWidth / 2 - magnifyingGlass.width() / 2
      });

      magnifyingGlass.hover(function () {
        $(this).css({
          background: 'white ',
          opacity: '1'
        });
      }, function () {
        $(this).css({
          background: 'rgba(0,0,0,0)',
        });
      });

      el.hover(function () {
        bar.css('top', elementBottom - barHeight);
        magnifyingGlass.css('visibility', 'visible');
        magnifyingGlass.fadeIn(500);
        $image.css({
          '-webkit-filter': 'brightness(50%)',
          '-moz-filter': 'brightness(50%)',
          'filter': 'brightness(50%)'

        });
      }, function () {
        bar.css('top', elementBottom);
        magnifyingGlass.fadeOut(500);
        $image.css({
          '-webkit-filter': 'brightness(100%)',
          '-moz-filter': 'brightness(100%)',
          'filter': 'brightness(100%)'
        });
      });

      $(window).resize(function () {
        bar.css({
          top: (o.location === 'top') ? 0 : elementBottom,
          left: 0
        });
      });
    },

    destroy: function () {
      this.element.next().remove();
      $(window).unbind('resize');
    },

    _setOption: function (option, value) {
      $.Widget.prototype._setOption.apply(this, arguments);

      var el = this.element,
        cap = el.next(),
        capHeight = cap.outerHeight(true);
      switch (option) {
      case 'location':
        (value == 'top') ? cap.css('top', el.offset().top): cap.css('top'.offset().top + el.Height - capHeight);
        break;
      case 'color':
        cap.css('color', value);
        break;
      case 'backgroundColor':
        cap.css('backgroundColor', value);
        break;
      }
    }
  });
});