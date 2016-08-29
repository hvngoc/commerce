$(document).ready(function () {
    'use strict';
    $('.product-item').product_item();
    $('.caption-product').captionator();
    $('#sign-in .sign-in-btn').click(function (e) {
        if (validateSignInForm()) {
            showSignIn();
        } else {
            return false;
        }
    });
    $('#sign-up #register-btn').click(function (e) {
        if (validateSignUpForm()) {
            overlay();
        } else {
            return false;
        };
    });
});
function showRenewPassword() {
    el = document.getElementById('wrapper-renew-password');
    el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
    if (el.style.visibility == 'visible') {
        el.style.background = 'rgba(0,0,0,0.5)';
        el.style.paddingTop = '9.5%';
        el.style.opacity = '1';
        $('body').addClass('stop-scrolling');
        setTimeout(function () {
            $('#sign-in .username').focus();
        }, 1000);

    } else {
        el.style.background = 'rgba(0,0,0,0)';

        el.style.paddingTop = '11%';
        el.style.opacity = '0';
        $('body').removeClass('stop-scrolling');
    }
}
function showSignUpFormSignIn() {
  showSignIn();
  overlay();
}

function overlay() {
  el = document.getElementById('overlay');
  el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
  if (el.style.visibility == 'visible') {

    el.style.background = 'rgba(0,0,0,0.5)';
    el.style.opacity = '1';
    el.style.padding = '50px';
    $('body').addClass('stop-scrolling');
    setTimeout(function () {
        $('#sign-up .first-name').focus();
    }, 1000);
  } else {
    el.style.background = 'rgba(0,0,0,0)';
    el.style.opacity = '0';
    el.style.padding = '0';
    $('body').removeClass('stop-scrolling');
  }
}

function showSignIn() {
  el = document.getElementById('wrapper-sign-in');
  el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
  if (el.style.visibility == 'visible') {
    el.style.background = 'rgba(0,0,0,0.5)';
    el.style.paddingTop = '9.5%';
    el.style.opacity = '1';
    $('body').addClass('stop-scrolling');
    setTimeout(function () {
      $('#sign-in .username').focus();
    }, 1000);

  } else {
    el.style.background = 'rgba(0,0,0,0)';

    el.style.paddingTop = '11%';
    el.style.opacity = '0';
    $('body').removeClass('stop-scrolling');

  }
}

function showShoppingCart() {
  el = document.getElementById('shopping-cart');
  el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
  if (el.style.visibility == 'visible') {
    el.style.top = '18%';
    el.style.opacity = '1';
  } else {
    el.style.top = '20%';
    el.style.opacity = '0';

  }
}

function validateInputNotNull(selector) {
  var pass = true;

  $(selector + ' input').each(function () {
      if ($(this).val() == "") {
          if ($(this).siblings('.error').length == 0) {
              $(this).after('<div class="error" style="color:red; font-size:12px; font-weight:500;text-align:center;">This field is required.</div>');
          } else {
              $(this).after().replace('<div class="error">This field is required.</div>');
          }
          pass = false;
      }
  });
  return pass;

}

function validateSignInForm() {
  var pass = validateInputNotNull('#sign-in');

  return pass;
}

function validateSignUpForm() {
  var pass = validateInputNotNull('#sign-up');
  return pass;
}