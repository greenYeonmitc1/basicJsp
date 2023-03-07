/**
 * 05_addnewitem.js
 */
var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$(document).ready(function(){
	$("#fileUploadForm").ajaxForm({
		success : function(data){
			alert("상품등록완료!");
			window.location.href=contextPath+"/itemListForManager.do";
		}
	});
});