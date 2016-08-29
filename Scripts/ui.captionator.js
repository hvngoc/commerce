$(function () {
  'use strict';
  $.widget('custom.captionator', {
    options: {
      location: 'bottom',
      color: '#fff',
      backgroundColor: '#000'
    },

    _create: function () {
      var self = this,
        o = self.options,
        el = this.element,
        image = el.find('img'),
        cap = $('<span></span>').text(image.attr('alt')).addClass('ui-widget ui-caption').css({
          backgroundColor: o.backgroundColor,
          color: o.color,
          width: el.width(),
          opacity: '0.3'
        }).insertAfter(image),
        capWidth = el.width(),
        capHeight = cap.outerHeight(true),
        bottomPosition = el.height();

      cap.css({
        width: capWidth,
        top: (o.location === "top") ? 0 : bottomPosition - capHeight,
        left: 0,
        display: 'block'
      });

      el.hover(function () {
        cap.css('opacity', '0.7');
      }, function () {
        cap.css('opacity', '0.3');
      });

      self._trigger('added', null, cap);
    },

    destroy: function () {
      this.element.next().remove();
    },

    _setOption: function (option, value) {
      $.Widget.prototype._setOption.apply(this, arguments);
      var el = this.element,
        cap = el.next(),
        capHeight = cap.outerHeight(true);
      switch (option) {
      case 'location':
        (value === 'top') ? cap.css('top', 0): cap.css('top', bottomPosition - capHeight);
        break;
      case 'color':
        el.next().css('color', value);
        break;
      case 'backgroundColor':
        el.next().css('backgroundColor', value);
        break;
      }
    }

  });
});