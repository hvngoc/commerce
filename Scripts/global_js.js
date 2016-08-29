function AddIdSanPhamtoList(param) {
    var url = "/Home/AddSanPhamIDtoGlobal";
    $.get(url, { sanPhamID: param }, function (data) {
        $("#shopping-table").html(data);
    });
}
function alertNeedLogin() {
    alert("Vui lòng đăng nhập để thanh toán");
}
function RemoveIdSanPhamFromList(param) {
    var url = "/Home/RemoveIdSanPhamFromList";
    $.get(url, { sanPhamID: param }, function (data) {
        $("#shopping-table").html(data);
    });
}