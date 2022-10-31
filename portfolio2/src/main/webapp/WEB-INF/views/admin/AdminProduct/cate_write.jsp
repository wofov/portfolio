<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<script>
function gook() {
	var ck = document.getElementById("ck");
	if(frm.bcode.value==""){
		alert("대메뉴 코드를 입력해주세요");
	}
	else if(frm.bmenu.value==""){
		alert("대메뉴 명을 입력해주세요");
	}
	else if(frm.scode.value=="" && ck.checked==false){
		alert("소메뉴 코드를 입력해주세요");
	}
	else if(frm.smenu.value=="" && ck.checked==false){
		alert("소메뉴 명을 입력해주세요");
	}
	else if(frm.smenu.value=="" && ck.checked==false && frm.scode.value==""){
		alert("소메뉴 코드를 입력해주세요");
	}
	else{
		frm.submit();
	}
}

</script>
<meta charset="UTF-8">
<p>카테고리 등록 페이지<form id="frm" name="frm" method="post" action="product-cate-write"></p>
<div class="cate_insert">
    <ul>
        <li>분류코드</li>
        <li><input type="text" class="cate_input1" readonly="readonly" id="code" name="code"></li>
        <li>※ 분류코드는 대메뉴 코드와 소메뉴 코드를 합쳐서 자동 입력 됩니다.</li>
    </ul>
    <ul>
        <li>대메뉴 코드</li>
        <li>
            <input type="text" class="cate_input2" list="lg_menu"onkeyup="pl()" id="bcode" name="bcode">
            <datalist id="lg_menu" value="" >
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
            </datalist>
        </li>
        <li>※ 대메뉴에 사용할 코드 번호를 입력하세요 최소 2자 이상의 숫자로 입력하셔야 합니다.</li>
    </ul>
    <ul>
        <li>대메뉴명</li>
        <li><input type="text" in="bmenu" name="bmenu" class="cate_input3"> <label><input type="checkbox" id="ck" name="ck" style="margin-left:10px; margin-right: 5px;">대메뉴만 생성</label></li>
        <li>※ 소메뉴만 등록시 대메뉴 코드와 대메뉴명은 무조건 입력 되어야 합니다.</li>
    </ul>
    <ul>
        <li>소메뉴 코드</li>
        <li>
            <input type="text" class="cate_input2" list="lg_menu" onkeyup="pl()"id="scode" name="scode">
            <datalist id="lg_menu" value="" >
               <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
            </datalist>
        </li>
        <li>※ 소메뉴에 사용할 코드 번호를 입력하세요 최소 2자 이상의 숫자로 입력하셔야 합니다.</li>
    </ul>
    <ul>
        <li>소메뉴명</li>
        <li><input type="text" class="cate_input3" id="smenu" name="smenu"></li>
        <li>※ 대메뉴만 등록시 소메뉴 코드 및 소메뉴명은 입력하지 않으셔도 됩니다.</li>
    </ul>
    <ul>
        <li>사용 유/무</li>
        <li>
            <label class="rmargin"><input type="radio" name="a" value="Y"checked>사용함 </label>
            <label class="rmargin"><input type="radio" name="a" value="N">사용안함</label>
        </li>
        <li>※ 카테고리 사용안함으로 설정시 쇼핑몰에 해당 메뉴는 생성 되지 않습니다.</li>
    </ul>
</div>
<div class="subpage_view4" style="text-align:center;">
    <input type="button" value="카테고리 리스트" title="카테고리 리스트" onclick="ba()"class="p_button p_button_color1" style="margin-right: 5px;">
    <input type="button" value="카테고리 생성" title="카테고리 생성" onclick="gook()" class="p_button p_button_color2">
    </span>
</div></form>
<script>
function ba() {
	location.href='./admin-category?sh=&val=';
}
function pl() {
	var b = document.getElementById("bcode").value;
	var c = document.getElementById("scode").value;
	var z = b+ c;
	document.getElementById("code").value=z;
}
</script>