$(document).ready(function(){
$(".quickview").colorbox({
iframe:true,
width:900,
maxWidth:"96%",
height:705,
maxHeight:"96%",
onOpen: function() {
$("#colorbox").addClass("quickview");
},
onClosed: function() {
headCart();
}
});
});
function headCart(){
	$('#cart').load('index.php?route=common/cart/info #cart > *');
	$('#wishlist-total').html(json['total']);
}