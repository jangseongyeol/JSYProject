/**
 * 
 */
function clickaction() {
	  var which1 = document.getElementById("newoption1");
	  var which2 = document.getElementById("newoption2"); 
	  var which3 = document.getElementById("newoption3"); 
	  var which4 = document.getElementById("newoption4"); 
	  var which5 = document.getElementById("newoption5"); 
	  var which6 = document.getElementById("newoption6"); 
	  
	   if (which1.style.display == 0) {
         which1.style.display = "block";
         which2.style.display = "none";
         which3.style.display = "none";
         which4.style.display = "none";
         which5.style.display = "none";
         which6.style.display = "none";
	   }
	   else if (which1.style.display == "none") {
		   which1.style.display = "block";
           which2.style.display = "none";
           which3.style.display = "none";
           which4.style.display = "none";
           which5.style.display = "none";
           which6.style.display = "none";
	   }
     else {
         which1.style.display ="none";
     } 
}

function clickaction2() {
	  var which1 = document.getElementById("newoption1");
	  var which2 = document.getElementById("newoption2"); 
	  var which3 = document.getElementById("newoption3"); 
	  var which4 = document.getElementById("newoption4"); 
	  var which5 = document.getElementById("newoption5"); 
	  var which6 = document.getElementById("newoption6");

	   if (which2.style.display == 0) {
       which2.style.display = "block";   
       which1.style.display = "none";
       which3.style.display = "none";
       which4.style.display = "none";
       which5.style.display = "none";
       which6.style.display = "none";
	   }
	   else if (which2.style.display == "none") {
		 which2.style.display = "block";
         which1.style.display = "none";
         which3.style.display = "none";
         which4.style.display = "none";
         which5.style.display = "none";
         which6.style.display = "none";
	   }
   else {
       which2.style.display ="none";
   } 
}

function clickaction3() {
	  var which1 = document.getElementById("newoption1");
	  var which2 = document.getElementById("newoption2"); 
	  var which3 = document.getElementById("newoption3"); 
	  var which4 = document.getElementById("newoption4"); 
	  var which5 = document.getElementById("newoption5"); 
	  var which6 = document.getElementById("newoption6");

	   if (which3.style.display == 0) {
       which3.style.display = "block";
       which1.style.display = "none";
       which2.style.display = "none";
       which4.style.display = "none";
       which5.style.display = "none";
       which6.style.display = "none";
	   }
	   else if (which3.style.display == "none") {
		 which3.style.display = "block";
         which1.style.display = "none";
         which2.style.display = "none";
         which4.style.display = "none";
         which5.style.display = "none";
         which6.style.display = "none";
	   }
   else {
       which3.style.display ="none";
   } 
}
function clickaction4() {
	  var which1 = document.getElementById("newoption1");
	  var which2 = document.getElementById("newoption2"); 
	  var which3 = document.getElementById("newoption3"); 
	  var which4 = document.getElementById("newoption4"); 
	  var which5 = document.getElementById("newoption5"); 
	  var which6 = document.getElementById("newoption6"); 

	   if (which4.style.display == 0) {
       which4.style.display = "block";
       which1.style.display = "none";
       which2.style.display = "none";
       which3.style.display = "none";
       which5.style.display = "none";
       which6.style.display = "none";
	   }
	   else if (which4.style.display == "none") {
		 which4.style.display = "block";
         which1.style.display = "none";
         which2.style.display = "none";
         which3.style.display = "none";
         which5.style.display = "none";
         which6.style.display = "none";
	   }
   else {
       which4.style.display ="none";
   } 
}
function clickaction5() {
	  var which1 = document.getElementById("newoption1");
	  var which2 = document.getElementById("newoption2"); 
	  var which3 = document.getElementById("newoption3"); 
	  var which4 = document.getElementById("newoption4"); 
	  var which5 = document.getElementById("newoption5"); 
	  var which6 = document.getElementById("newoption6"); 
    
	   if (which5.style.display == 0) {
       which5.style.display = "block";
       which1.style.display = "none";
       which2.style.display = "none";
       which3.style.display = "none";
       which4.style.display = "none";
       which6.style.display = "none";
	   }
	   else if (which5.style.display == "none") {
		 which5.style.display = "block";
         which1.style.display = "none";
         which2.style.display = "none";
         which3.style.display = "none";
         which4.style.display = "none";
         which6.style.display = "none";
	   }
   else {
       which5.style.display ="none";
   } 
}
function clickaction6() {
	  var which1 = document.getElementById("newoption1");
	  var which2 = document.getElementById("newoption2"); 
	  var which3 = document.getElementById("newoption3"); 
	  var which4 = document.getElementById("newoption4"); 
	  var which5 = document.getElementById("newoption5"); 
	  var which6 = document.getElementById("newoption6"); 
    
	   if (which6.style.display == 0) {
       which6.style.display = "block";
       which1.style.display = "none";
       which2.style.display = "none";
       which3.style.display = "none";
       which4.style.display = "none";
       which5.style.display = "none";
	   }
	   else if (which6.style.display == "none") {
		 which6.style.display = "block";
         which1.style.display = "none";
         which2.style.display = "none";
         which3.style.display = "none";
         which4.style.display = "none";
         which5.style.display = "none";
	   }
   else {
       which6.style.display ="none";

   } 
}

function change() {
	var m=document.getElementById("close")
	if (m.innerText=="닫기") {
	m.innerText="열기"
	} else {
		m.innerText="닫기"
	}
}
function openNav() {
	document.getElementsByClassName('mainsidediv')[0].classList.toggle('collapsed');
	document.getElementsByClassName('newoption1')[0].classList.toggle('collapsed');
	document.getElementsByClassName('newoption2')[0].classList.toggle('collapsed');
	document.getElementsByClassName('newoption3')[0].classList.toggle('collapsed');
	document.getElementsByClassName('newoption4')[0].classList.toggle('collapsed');
	document.getElementsByClassName('newoption5')[0].classList.toggle('collapsed');
	document.getElementsByClassName('newoption6')[0].classList.toggle('collapsed');
	document.getElementsByClassName('sidemenuname')[0].classList.toggle('collapsed');	
	}
function hide(v) {
	document.getElementById(v).style.display = "none";
}

function showlogin(){
	var newoption5_div1_1=document.getElementById('newoption2_div1_1');
	var newoption5_div1_2=document.getElementById('newoption2_div1_2');
	newoption5_div1_1.style.display="inline-block";
    newoption5_div1_2.style.display="none";
	document.getElementById('newoption2_div1').style.borderBottom="3px solid";
	document.getElementById('newoption2_div2').style.borderBottom="1px solid";

}
function showorder(){
	var newoption5_div1_1=document.getElementById('newoption2_div1_1');
	var newoption5_div1_2=document.getElementById('newoption2_div1_2');
	newoption5_div1_2.style.display="inline-block";
	newoption5_div1_1.style.display="none";
	document.getElementById('newoption2_div2').style.borderBottom="3px solid";
	document.getElementById('newoption2_div1').style.borderBottom="1px solid";
}
function showlogin2(){
	var newoption5_div1_1=document.getElementById('newoption5_div1_1');
	var newoption5_div1_2=document.getElementById('newoption5_div1_2');
	newoption5_div1_1.style.display="inline-block";
    newoption5_div1_2.style.display="none";
	document.getElementById('newoption5_div1').style.borderBottom="3px solid";
	document.getElementById('newoption5_div2').style.borderBottom="1px solid";
	 
}
function showorder2(){
	var newoption5_div1_1=document.getElementById('newoption5_div1_1');
	var newoption5_div1_2=document.getElementById('newoption5_div1_2');
	newoption5_div1_2.style.display="inline-block";
	newoption5_div1_1.style.display="none";
	document.getElementById('newoption5_div2').style.borderBottom="3px solid";
	document.getElementById('newoption5_div1').style.borderBottom="1px solid";
}
function popup(url,name){
    var option = "width = 350, height = 350, top = 50, left = 50, location = no scrollbars = no  resizable = yes";
    	window.open(url, name, option);
    
}
