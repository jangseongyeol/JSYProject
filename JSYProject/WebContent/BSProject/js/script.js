/**
 * 
 */
$(document).ready(function () {
           
	           $('.carousel').carousel();
	  
	         /* 자동으로 5초의 지연시간이 설정되어 있는데 아래와 같이 바꿀수 있다. 
	          아래 코드 쓰려면 위 코드 지워야 한다.       
	          
	         $('.carousel').carousel({
	             interval: 1000 */
	         	
	
	                 $('#sidebar_toggle').on('click', function () {
                     $('#sidebar').toggleClass('active');
                     $('#sidebar_toggle').hide("slow");
                 });
                 $('#dismiss').on('click', function () {
                     $('#sidebar').toggleClass('active');
                     $('#sidebar_toggle').show("slow");
                 });
                 $('#sidebar_right_close').on('click', function () {
                		 $('#sidebar-right').toggleClass('active');		 
                });
                $('#sidebar_right_open').on('click', function () {
                	$('#sidebar-right').toggleClass('active');
                });
           });


