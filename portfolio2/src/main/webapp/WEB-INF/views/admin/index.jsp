<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<script>
	function cknew() {
		if(frm.adid.value==""){
			alert("관리자 아이디를 입력하세요.");
			return false;
		}
		else if(frm.adpw.value==""){
			alert("관리자 패스워드를 입력하세요.");
			return false;
		}
		else{
			var id=frm.adid.value;
			var pw=frm.adpw.value;
			var ajax = new XMLHttpRequest();
			ajax.open("post","./login?adid="+id+"&adpw="+pw,true);
			ajax.send();
			ajax.onload = function() {
			   if(ajax.status==200){
			      console.log(ajax.response);
			      if(ajax.response=="ok"){location.href="admin-main";}
			      else if(ajax.response=="notyet"){alert("관리자 미승인 상태입니다.");}
			      else {alert("관리자 정보를 확인해주세요.");}
			   	}
			}
			return false;
		}
	}
	
</script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" type="text/css" href="./css/basic.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=5">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
</head>
<body style="height:100vh;">
<%
String adname = (String)session.getAttribute("anm");
// if(adname!=null){
// 	out.print("<script>"
// 			+ "alert('접근불가');"
// 			+ "location.href='./admin_list.do';"
// 			+ "</script>");
// }
%>
<input type="hidden" value="<%=adname %>" id="adad">
    <header class="admin_title">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
    </header>
<form id="frm" name="frm">
    <section class="admin_bgcolor">
        <div class="admin_login">
            <span>
                <div class="left_div">
                <ul>
                <li><input type="text" class="input_text1" name="adid" placeholder="관리자 아이디를 입력하세요"></li>
                <li><input type="password" class="input_text1" name="adpw" placeholder="관리자 패스워드를 입력하세요"></li>
                </ul>
                </div>
                <div class="right_div">
                    <button type="submit" onclick="return cknew()" class="btn_submit" title="MASTER LOGIN">MASTER LOGIN</button>
                </div>
                <em class="alert_msg">※ 본 사이트는 관리자 외에는 접근을 금합니다. 페이지 접근에 대한 접속 정보는 모두 기록 됩니다.</em>
            </span>
            <span>
                <ol class="admin_info">
                    <li title="신규 관리자 등록요청"><a href="./adminjoin-info" style ="color:  white">신규 관리자 등록요청</a></li>
                    <li title="아이디/패스워드 찾기">아이디/패스워드 찾기</li>
                </ol>                
            </span>
        </div>
    </section>
    </form>
    <footer class="admin_copy_login">
        <div>
            Copyright ⓒ 2022 webshopping All rights reserved.
        </div>
    </footer>
</body>
</html>