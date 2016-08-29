function showCapNhatThongTin() {
    el = document.getElementById('wrapper-capnhat-thongtin');
    el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
    if (el.style.visibility == 'visible') {
        el.style.background = 'rgba(0,0,0,0.5)';
        el.style.paddingTop = '9.5%';
        el.style.opacity = '1';
        $('body').addClass('stop-scrolling');
        setTimeout(function () {
            $('#sign-in .fisrt-name').focus();
        }, 1000);

    } else {
        el.style.background = 'rgba(0,0,0,0)';

        el.style.paddingTop = '11%';
        el.style.opacity = '0';
        $('body').removeClass('stop-scrolling');
    }
}
function releaseCapNhatThongTin() {
    var url = "/Customer/UpdateThongTin";
    var first = $('#firstNameTT').val();
    var last = $('#lastNameTT').val();
    $.get(url, { firstname: first, lastname: last }, function (data) {
        alert(data);
    });
    showCapNhatThongTin();
}
function showThayDoiMatKhau() {
    el = document.getElementById('wrapper-capnhat-matkhau');
    el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
    if (el.style.visibility == 'visible') {
        el.style.background = 'rgba(0,0,0,0.5)';
        el.style.paddingTop = '9.5%';
        el.style.opacity = '1';
        $('body').addClass('stop-scrolling');
        setTimeout(function () {
            $('#sign-in .password').focus();
        }, 1000);

    } else {
        el.style.background = 'rgba(0,0,0,0)';

        el.style.paddingTop = '11%';
        el.style.opacity = '0';
        $('body').removeClass('stop-scrolling');
    }
}
function releaseThayDoiMatKhau() {
    var url = "/Customer/UpdateMatKhau";
    var mat = $('#matKhauTT').val();
    $.get(url, { matkhau: mat}, function (data) {
        alert(data);
    });
    showThayDoiMatKhau();
}
function showKiemTraTaiKhoan() {
    el = document.getElementById('wrapper-kiemtra-taikhoan');
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
function releaseKiemTraTaiKhoan() {
    var url = "/Customer/KiemTraTaiKhoan";
    var mat = $('#TaiKhoanTT').val();
    $.get(url, { taikhoan: mat }, function (data) {
        alert(data);
    });
    showKiemTraTaiKhoan();
}

function showThemTaiKhoan() {
    el = document.getElementById('wrapper-themmoi-taikhoan');
    el.style.visibility = (el.style.visibility == 'visible') ? 'hidden' : 'visible';
    if (el.style.visibility == 'visible') {
        el.style.background = 'rgba(0,0,0,0.5)';
        el.style.paddingTop = '9.5%';
        el.style.opacity = '1';
        $('body').addClass('stop-scrolling');
        setTimeout(function () {
            $('#sign-in .first-name').focus();
        }, 1000);

    } else {
        el.style.background = 'rgba(0,0,0,0)';

        el.style.paddingTop = '11%';
        el.style.opacity = '0';
        $('body').removeClass('stop-scrolling');
    }
}
function releaseThemTaiKhoan() {
    var url = "/Customer/ThemTaiKhoanMoi";
    var tk = $('#TaiKhoanTTThem').val();
    var mk = $('#matKhauTTThem').val();
    var em = $('#emailTTThem').val();
    var fn = $('#lastNameTTThem').val();
    var ln = $('#firstNameTTThem').val();
    $.get(url, { fname: fn, lname: ln, uname: tk, email: em, password: mk }, function (data) {
        alert(data);
    });
    showThemTaiKhoan();
}
function showXoaTaiKhoan() {
    el = document.getElementById('wrapper-xoa-taikhoan');
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
function releaseXoaTaiKhoan() {
    var url = "/Customer/XoaTaiKhoan";
    var tk = $('#TaiKhoanTTxoa').val();
    $.get(url, { taikhoan: tk }, function (data) {
        alert(data);
    });
    showXoaTaiKhoan();
}
function showDongGopYKien() {
    el = document.getElementById('wrapper-donggop-ykien');
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
function releaseDongGopYKien() {
    var url = "/Customer/DongGopYKien";
    var tk = $('#NoiDungTT').val();
    $.get(url, { noidung: tk }, function (data) {
        alert(data);
    });
    showDongGopYKien();
}