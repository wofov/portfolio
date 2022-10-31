$(function () {
	$("#joinok").click(function () {
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
		}
		else if($("#userpw").val()==""){
			alert("패스워드를 입력하세요");
		}
		else if($("#userpw").val()==""){
			alert("동일한 패스워드를 입력하세요");
		}
		else if($("#usernm").val()==""){
			alert("이름을 입력하세요");
		}
		else if($("#useremail").val()==""){
			alert("이메일을 입력하세요");
		}
		else if($("#usertel").val()==""){
			alert("연락처를 입력하세요");
		}
		else if($("#addr1").val()==""){
			alert("주소검색 버튼을 클릭하여 도로명을 입력하세요");
		}
		else if($("#addr3").val()==""){
			alert("상세주소를 입력해주세요");
		}
		else{
			if($("#ck").val()!="ok"){
				alert("아이디 중복 체크를 해주세요");
			}
			else if($("#userpw").val()!=$("#userpw2").val()){
				alert("동일한 패스워드를 입력하세요");
			}
			else if($("#useremail").val()!=""){
				var eck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,8}$/i;
				if(eck.test($("#useremail").val()==false)){ 
					alert("정상적인 이메일 주소를 입력하세요");
				}	
				else{
					if(isNaN($("#usertel").val())==true){
						alert("정산적인 연락처를 입력해주세요");
					}
					else if($("#usertel").val().length <10){
						alert("정산적인 연락처를 입력해주세요");
					}
					
					else{
						f.method="post";
						f.action="joinok.do";
						f.enctype="application/x-www-form-urlencoded";
						f.submit();
					}
				}
			} 
		}
	});
	
	});
	
	
	
	