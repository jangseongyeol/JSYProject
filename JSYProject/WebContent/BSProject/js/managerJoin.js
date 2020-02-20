/**
 * 
 */
$(function(){
    // 회원 가입 처리
	
    $('#join-submit').click(function(){
    	
	//이름 체크
	var name = document.getElementById("managername");
	
	//\x20: 16진수 20=> 10진수 32, (스페이스 1개인 공객문자를 의미) 
	var exp2= /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2,10}$/;
	if(!exp2.test(name.value)){
		alert("이름은 한글 3~10자 이내로 입력하세요.");
		name.focus();
		return false;
	}
	//아이디 체크
	var managerid =document.getElementById("managerid");
	if(managerid.value=="") {
		alert("아이디는 필수 입력입니다.");
		managerid.focus();
		return false;
	}
	//^시작, $끝, {4,10}글자수 지정
	var exp1=/^[A-Za-z0-9]{4,10}$/;//정규표현식
	//정규표현식.test(검사할 문자열) - 규칙에 맞으면 true, 틀리면 false
	if(!exp1.test(managerid.value)) {
		alert("아이디는 영문자,숫자 4~10자리로 입력하세요.");
		managerid.focus();
		return false;
	}
	//비밀번호 체크
	var password =document.getElementById("passwd");
	var passwordcheck=document.getElementById("passwdCheck");
	var exppwd=/^(?=.*[a-zA-Z]{1,16})(?=.*[!@#$%^*+=-]{1,16})(?=.*[0-9]{1,16}).{8,16}$/;
	if(!exppwd.test(passwd.value)){
		alert('숫자, 영문자, 특수문자 조합으로 8~16자리를 사용해야 합니다.');
		passwd.focus();
		return false;
	}
	if(passwd.value != managerid)
	  if(passwd.value != passwordcheck.value) {
          alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
          passwordcheck.value = "";
          passwordcheck.focus();
          return false;
      }
	
	//이메일 체크
	var email=document.getElementById("manageremail");
	
	var exp3= /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	if(!exp3.test(email.value)) {
		alert("이메일 형식이 잘못 되었습니다. ex) abc@abc.com");
		email.focus();
		return false;
	}
	//전화번호 체크
	var phone2 = document.getElementById("phone2");
	var exp=/^[0-9]+$/;
	console.log("match: "+phone2.value.match(exp));
	console.log("test"+exp.test(phone2.value));
	if(!phone2.value.match(exp)) {
		alert("핸드폰번호는 숫자만 입력하세요.");
		phone2.focus();
		return false;
	}
	var phone3 = document.getElementById("phone3");
	var exp=/^[0-9]+$/;
	console.log("match: "+phone3.value.match(exp));
	console.log("test"+exp.test(phone3.value));
	if(!phone3.value.match(exp)) {
		alert("핸드폰번호는 숫자만 입력하세요.");
		phone3.focus();
		return false;
	}
	var birthday1 = document.getElementById("birthday1");
	var exp=/^[0-9]+$/;
	console.log("match: "+birthday1.value.match(exp));
	console.log("test"+exp.test(phone2.value));
	if(!birthday1.value.match(exp)) {
		alert("년도는 숫자만 입력하세요.");
		birthday1.focus();
		return false;
	}
	var birthday3 = document.getElementById("birthday3");
	var exp=/^[0-9]+$/;
	console.log("match: "+birthday3.value.match(exp));
	console.log("test"+exp.test(phone2.value));
	if(!birthday3.value.match(exp)) {
		alert("일은 숫자 2자리로 입력하세요.");
		birthday3.focus();
		return false;
	}
	var postcode =document.getElementById("postcode");
	if(postcode.value=="") {
		alert("우편번호는 필수 입력입니다.");
		postcode.focus();
		return false;
	}
	var address =document.getElementById("address");
	if(address.value=="") {
		alert("주소는 필수 입력입니다.");
		address.focus();
		return false;
	}
	var address2 =document.getElementById("address2");
	if(address2.value=="") {
		alert("상세주소는 필수 입력입니다.");
		address2.focus();
		return false;
	}
	
        if($('#provisionYn:checked').val()=="N"){
        	alert("회원가입약관에 동의하여 주시기 바랍니다."); 
        	return false;
		}
		
		//개인정보취급방침
		if($('#memberInfoYn:checked').val()=="N"){
			alert("개인정보취급방침에 동의하여 주시기 바랍니다.");
			return false;
		}
        
		
		document.managerJoin_form.submit();
		/*var param="managerid="+$("#managerid").val()
		+"&managername="+$("#managername").val()
		+"&passwd="+$("#passwd").val()
		+"&manageremail="+$("#manageremail").val()
		+"&phone1="+$("#phone1").val()
		+"&phone2="+$("#phone2").val()
		+"&phone3="+$("#phone3").val()
		+"&birthday1="+$("#birthday1").val()
		+"&birthday2="+$("#birthday2").val()
		+"&birthday3="+$("#birthday3").val()
		+"&postcode="+$("#postcode").val()
		+"&address="+$("#address").val()
		+"&address2="+$("#address2").val()
		
        $.ajax({
            type: "POST",
            url: "/storemanager_servlet/insertManager.do",
            data: param,
            success: function (){
            	alert('회원가입을 축하합니다.');
            	location.replace('manager_index.jsp'); // 화면 갱신            	
            }, error: function() {
                alert('회원가입실패');
            }
        });*/
    });
});
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2').focus();
        }
    }).open();
}

function cancel(){		
	document.managerJoin_form.action="../BSProject/manager_index.jsp";
	document.managerJoin_form.submit();
}