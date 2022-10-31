<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function nojoin() {
	if(confirm("등록취소 하시겠습니까?")){location.href = "./admin";}}
	function join() {
		if(frm.jid.value=="" || frm.jid.value.length<4){
			alert("아이디는 4자 이상 입력해주세요");
		}
		else if(frm.jpw.value=="" || frm.jpw.value.length<4){
			alert("비밀번호 4자 이상 16자 이하로 입력해주세요.");
		}
		else if(frm.jpw.value!=frm.jpw2.value){
			alert("동일한 패스워드를 입력해주세요.");
		}
		else if(frm.jname.value==""){
			alert("이름을 입력해주세요.");
		}
		else if(frm.jemail.value==""){
			alert("이메일을 입력해주세요.");
		}
		else if(frm.jemail.value.indexOf("@")==-1 || frm.jemail.value.indexOf(".")==-1){
			alert("올바른 이메일을 입력해주세요.");
		}
		else if(frm.te1.value=="" || frm.te1.value.length!=3 ||isNaN(frm.te1.value)==true){
			alert("올바른 핸드폰 번호 및 숫자만 입력해주세요.");
		}
		else if(frm.te2.value=="" || frm.te2.value.length!=4 ||isNaN(frm.te2.value)==true){
			alert("올바른 핸드폰 번호 및 숫자만 입력해주세요.");
		}
		else if(frm.te3.value=="" || frm.te3.value.length!=4 ||isNaN(frm.te3.value)==true){
			alert("올바른 핸드폰 번호 및 숫자만 입력해주세요.");
		}
		
		else if(frm.jm1.value==""){
			alert("담당 부서를 선택해주세요.");
		}
		else if(frm.jm2.value==""){
			alert("담당 직책을 선택해주세요.");
		}
		else if(frm.ck.value=="0"){
			alert("아이디 중복체크를 눌러주세요");
		}
		else{
			if(confirm("입력된 정보로 관리자 등록을 진행하시겠습니까?")){	
				frm.submit();
			}
		}
	}
	
	function jo() {
		
		var jid = document.getElementById("jid").value;
		if(frm.jid.value=="" || frm.jid.value.length<4){
			alert("아이디는 4자 이상 입력해주세요");
		}
		else if(frm.jid.value=="admin" || frm.jid.value=="master" ){
			alert("해당 아이디는 사용불가 아이디입니다.");
		}
 		else{
 			ajax(jid);
 		}
	}
	function ajax(jid) {
		var da;
		 function wck() {     
		     if(window.XMLHttpRequest){
		   	      return new XMLHttpRequest;
		      };
		 }
		 function aa2() {
		 if(da.readyState == XMLHttpRequest.DONE && da.status==200){
		      if(this.response=="no"){
		         alert("중복된 아이디 입니다.");
		      }
		      else{
		          alert("사용가능한 아이디 입니다.");
		          var hi= document.getElementById("ck").value++;
		          document.getElementById("jid").readOnly=true;
		          
		      }
			 }
		 }
		 var dd = "jid="+jid;
		 da = wck();
		 da.onreadystatechange = aa2;
		 da.open("POST","./idck",true);
		 da.setRequestHeader("content-type","application/x-www-form-urlencoded");
		 da.send(dd);	
	}
</script>