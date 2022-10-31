<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String aid = (String)session.getAttribute("aid");
request.setAttribute("aid",aid);
%>
<script>
	function upgo() {
		if(frm.pw1.value==""){alert("변경할 패스워드를 입력하세요");
			frm.pw1.focus();
		}
		else if(frm.pw1.value!=frm.pw2.value){alert("동일한 패스워드를 입력하세요");
		}
		else if(frm.na1.value==""){alert("이름을 입력하세요");
		}
		else if(frm.email1.value==""){alert("이메일을 입력하세요");
		}
		else if(frm.tel1.value=="" || frm.tel1.value.length!=3 ||isNaN(frm.tel1.value)==true){
			alert("핸드폰 번호를 올바르게 입력해주세요");
		}
		else if(frm.tel2.value=="" || frm.tel2.value.length!=4 ||isNaN(frm.tel2.value)==true){
			alert("핸드폰 번호를 올바르게 입력해주세요");
		}
		else if(frm.tel3.value=="" || frm.tel3.value.length!=4 ||isNaN(frm.tel3.value)==true){
			alert("핸드폰 번호를 올바르게 입력해주세요");
		}
		else if(frm.sel1.value==""){alert("부서를 선택 해주세요");
		}
		else if(frm.sel2.value==""){alert("직책을 선택 해주세요");
		}
		else{frm.submit();}
	}
</script>
<form id="frm" name="frm" method="post" action="info-update">
<div class="admin_login_add">
    <ul>
        <li class="font_color1">관리자 정보 수정</li>
        <li>
        <input type="text" class="add_input1" name="id1" readonly value="<%=aid %>">
        </li>
        <li>
            <input type="password" class="add_input1" name="pw1" placeholder="변경할 패스워드를 입력하세요">
            <input type="password" class="add_input1" name="pw2" placeholder="동일한 패스워드를 입력하세요">
        </li>
        <li class="font_color1">관리자 기본정보 입력</li>
        <li>
            <input type="text" class="add_input1" placeholder="담당자 이름을 입력하세요" name="na1">
        </li>
        <li>
        <input type="text" class="add_input1 emails" placeholder="담당자 이메일을 입력하세요" name="email1">
        </li>
        <li class="font_color1">
        <input type="text" class="add_input1 hp1" maxlength="3" value="010" name="tel1">
        -
        <input type="text" class="add_input1 hp2" maxlength="4" placeholder="1234" name="tel2">
        -
        <input type="text" class="add_input1 hp2" maxlength="4" placeholder="5678" name="tel3">
        </li>
        <li class="font_color1">관리자 담당부서 및 직책</li>
        <li>
            <select class="add_select1" name="sel1">
                <option value="">담당자 부서를 선택하세요</option>
                <option value="임원">임원</option>
                <option value="전산팀">전산팀</option>
                <option value="디자인팀">디자인팀</option>
                <option value="CS팀">CS팀</option>
                <option value="MD팀">MD팀</option>
            </select>
            <select class="add_select1" name="sel2">
                <option value="">담당자 직책을 선택하세요</option>
                <option value="대표">대표</option>
                <option value="부장">부장</option>
                <option value="팀장">팀장</option>
                <option value="과장">과장</option>
                <option value="대리">대리</option>
                <option value="사원">사원</option>
            </select>
        </li>
        <li class="font_color1">※ 아이디 외에 모든 정보는 수정 할 수 있습니다.</li>
    </ul>
    <span class="admin_addbtn">
        <input type="button" class="btn_button btncolor1" onclick="upgo()" value="정보수정">
    </span>
</div>
        </form>