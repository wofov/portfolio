<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<script src="./js/jquery.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
$(function () {
	$("#search_addr").postcodifyPopUp({//주소찾기 버튼
		insertPostcode5:"#addr1",
		insertAddress:"#addr2",
	});
});
function sele() {
	var em = document.getElementById("selem").value;
	document.getElementById("cem2").value = em;
}
function join_to() {
	if(f.cid.value==""){
		alert("아이디를 입력하세요");
	}
	else if(f.cpw.value==""||f.cpw2.value==""){
		alert("패스워드를 입력하세요");
	}
	else if(f.cpw.value!=f.cpw2.value){
		alert("올바른 패스워드를 입력하세요");
	}
	else if(f.cname.value==""){
		alert("이름을 입력하세요");
	}
	else if(f.cem1.value==""||f.cem2.value==""){
		alert("이메일을 입력하세요");
	}
	else if(f.ctel1.value==""||f.ctel2.value==""||f.ctel3.value==""){
		alert("핸드폰 번호를 입력하세요");
	}
	else if(f.cpost.value==""||f.addr2.value==""){
		alert("주소를 입력하세요");
	}
	else if(f.addr3.value==""){
		alert("상세 주소를 입력하세요");
	}
	else if(f.ck.value=="0"){
		alert("아이디 중복체크를 눌러주세요");
	}
	else{
		alert("이메일로 전송된 번호를 클릭하면 가입이 완료됩니다");
		f.submit();
	}
	
	
}
function eddck() {
	var cid = document.getElementById("cid").value;
	if(f.cid.value=="" || f.cid.value.length<4){
		alert("아이디는 4자 이상 입력해주세요");
	}
	else if(f.cid.value=="admin" || f.cid.value=="master" ){
		alert("해당 아이디는 사용불가 아이디입니다.");
	}
		else{
			ajaxidck(cid);
		}
}
function ajaxidck(cid) {
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
	          document.getElementById("cid").readOnly=true;
	      }
		 }
	 }
	 var dd = "cid="+cid;
	 da = wck();
	 da.onreadystatechange = aa2;
	 da.open("POST","./edd-idck",true);
	 da.setRequestHeader("content-type","application/x-www-form-urlencoded");
	 da.send(dd);	
}
</script>
<div class="title_container">
	<h2><span designElement="text" textIndex="1">회원정보 입력</span></h2>
</div>
<div class="mypage_greeting Pb30">
	<span class="pilsu_icon"></span> <span designElement="text" textIndex="2">항목은 <span class="pointcolor">필수 입력</span> 항목입니다.</span>
</div>


<div class="resp_member_join_wrap">
 <div id="formMemberArea" class="resp_member_join">
	<input type="hidden" name="kid_agree" value=""/>
	<div class="resp_join_table">
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="8">아이디</p></li>
				<li class="td">
						<input type="text" id="cid" autocapitalize="off" name="cid" class="eng_only" placeholder="공백 없는 영문/숫자 포함 6~20자" />
						<p id="id_info" class="guide_text"></p>
						<button type="button" class="btn_resp size_b color4" onclick="eddck()">중복체크</button>
						<input type="hidden" name="ck" id="ck" value="0">
				</li>
			</ul>
				<ul class="required">
					<li class="th "><p designElement="text" textIndex="11" >비밀번호</p></li>
					<li class="td">
						<input type="password" name="cpw" class="eng_only class_check_password_validation" />
					</li>
				</ul>
				<ul class="required">
					<li class="th "><p designElement="text" textIndex="12" >비밀번호 확인</p></li>
					<li class="td">
						<input type="password" name="cpw2" class="eng_only" />
					</li>
				</ul>
				<ul class="required">
					<li class="th"><p designElement="text" textIndex="13" >이름</p></li>
					<li class="td">
						<input type="text" name="cname" />
					</li>
				</ul>
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="14" >이메일</p></li>
				<li class="td">
					<input type="email" name="cem1" class="size_mail1" /> @
					<input type="email" name="cem2" id="cem2" class="size_mail2" />
					<select id="selem" name="selem" onchange="sele()">
						<option value="" >직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empal.com">empal.com</option>
							<option value="unitel.co.kr">unitel.co.kr</option>
							<option value="gmail.com">gmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="chol.com">chol.com</option>
							<option value="paran.com">paran.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
					</select>
				</li>
			</ul>
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="16" >휴대폰번호</p></li>
				<li class="td">
					<input type="tel" name="ctel1" class="size_phone" maxlength="3"  /> -
					<input type="tel" name="ctel2" class="size_phone" maxlength="4"  /> -
					<input type="tel" name="ctel3" class="size_phone" maxlength="4"  />
				</li>
			</ul>
			<ul >
				<li class="th "><p designElement="text" textIndex="22" >주소</p></li>
				<li class="td">
					<input type="hidden" value=""/>
					<input type="tel" value="" class="size_zip_all" id="addr1" name="cpost" readonly />
					<button type="button" class="btn_resp size_b color4" id="search_addr"><span designElement="text" textIndex="23" >주소찾기</span></button>
					<div class="address_area">
						<input type="text"  class="address size_full " id="addr2" name="addr2" readonly />
						<input type="text"  class="address_street size_full hide"  readonly />
					</div>
					<div class="address_area">
						<input type="text" name="addr3" class="size_full" />
					</div>
					<p id="address_view" style="padding-top:5px; display:none;"></p>
				</li>
			</ul>
			<ul class="required">
					<li class="th "><p designElement="text" textIndex="11" >추천인 아이디</p></li>
					<li class="td">
						<input type="text" name="com" class="eng_only class_check_password_validation" />
					</li>
				</ul>

	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".selectLabelSet").each(function(){
			var selectLabelSetObj = $(this);
			$("select.selectLabelDepth1",selectLabelSetObj).bind('change',function(){
				var childs = $("option:selected",this).attr('childs').split(';');
				var joinform_seq = $(this).attr('joinform_seq');
				var select2 = $("input.hiddenLabelDepth[type='hidden'][joinform_seq='"+joinform_seq+"']").val();
				if(childs[0]){
					$(".selectsubDepth",selectLabelSetObj).show();
					$("select.selectLabelDepth2[joinform_seq='"+joinform_seq+"']").empty();
					for(var i=0; i< childs.length ; i++){
						$("select.selectLabelDepth2[joinform_seq='"+joinform_seq+"']")
						.append("<option value='"+childs[i]+"'>"+childs[i]+"</option>");
					}
				}else{
					$(".selectsubDepth",selectLabelSetObj).hide();
				}
				$("select.selectLabelDepth2 option[value='"+select2+"']").attr('selected',true);
			}).trigger('change');
		});


		/* ========== 반응형 프론트엔드 추가 ========= */
		// designed radio UI
		$('.designed_radio_checkbox input[type=radio]').closest('.designed_radio_checkbox').addClass('type_radio');
		$('.designed_radio_checkbox input[checked]').parent('label').addClass('on');

		$('.designed_radio_checkbox input[type=radio]').on('change', function() {
			$(this).parent().parent().find('label').removeClass('on');
			$(this).parent('label').addClass('on');
		});
		// designed checkbox UI
		$('.designed_radio_checkbox input[type=checkbox]').on('change', function() {
			if ( $(this).prop('checked') ) {
				$(this).parent('label').addClass('on');
			} else {
				$(this).parent('label').removeClass('on');
			}
		});
		/* ========== //반응형 프론트엔드 추가 ========= */
	});
</script>
	<!-- ------- //회원가입 입력폼 ------- -->

	<div id="btn_register" class="btn_area_c">
		<button type="button" class="btn_resp size_c color2 Wmax" onclick="join_to()">
		<span designElement="text">입력 완료</span>
		</button>
	</div>
</div>