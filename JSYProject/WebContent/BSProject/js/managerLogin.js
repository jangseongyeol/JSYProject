/**
 * 
 */

$(function() {
	
    // 로그인 처리
    $('#login-submit').click(function(e) {     
    	loginManager();
    	document.managerLogin_form.submit();
    }); 
    $('#managerLogout').click(function() {
		document.managerLogout_form.submit();
   });   
});

function loginManager(){
	
	if ($("#managerid").val() == '') {
        alert('아이디를 입력하세요');
        $("#managerid").focus();
        return false;
    }
    if ($("#passwd").val() == '') {
        alert('비밀번호를 입력하세요');
        $("#passwd").focus();
        return false;       
	}	
  
}