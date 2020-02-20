/**
 * 
 */
$(function(){
	$("#btnlogin").click(function(){
	   login();	
	});
});

function login(){
	$.ajax({
		type:"post",
		url:"/jsmbproject/storemember_servlet/login.do",
		success: function(){
			location.replace("login_success.jsp");
		}
	});
}