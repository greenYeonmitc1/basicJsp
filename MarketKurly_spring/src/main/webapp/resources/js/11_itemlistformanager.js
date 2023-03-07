/**
 * 12_itemListForManager.js
 */

var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function edit(editBtn){
	var str = editBtn.name;
	var query = contextPath+"/updateItem.do?item_number="+str;
	window.location.href=query;
}
function del(delBtn){
	var str = delBtn.name;
	var query = contextPath+"/deleteItemPro.do?item_number="+str;
	window.location.href=query;
}