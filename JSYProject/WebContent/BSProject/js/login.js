/**
 * 
 */
$(function() {
	
    // 로그인 처리
    $('#login-submit').click(function() {     
        loginStore();
        document.login_form.submit();
    });
    //로그아웃 처리
    $('#logout').click(function() {   	
			document.logout_form.submit();
    });    

});

function loginStore(){
	
	if ($("#userid").val() == '') {
        alert('아이디를 입력하세요');
        $("#userid").focus();
        return false;
    }
    if ($("#passwd").val() == '') {
        alert('비밀번호를 입력하세요');
        $("#passwd").focus();
        return false;       
	}	
  
}
