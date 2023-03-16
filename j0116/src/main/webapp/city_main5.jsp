<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>부산 시티투어 미니버스</title>

     <!--   <script src="js/jquery-3.3.1.min.js"></script> -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!--    <link rel="stylesheet" type="text/css" href="./css/city.css">  -->

    <script>
    window.onload = function(){ 
        $(function(){
            $('#datepic').datepicker();
       });

        $(document).ready(function() {
            $("#gnb .m").on("mouseenter focusin", function() {
                $("ul", this).show();
                $(this).siblings("li").find("ul").hide();
                $(this).addClass("on").siblings("li").removeClass("on");                
            }).on("mouseleave", function() {
                $("#gnb ul").hide().add("#gnb .m").removeClass("on");                
            });
            $("*:not('#gnb a')").on("focus", function() {
                $("#gnb ul").hide().add("#gnb .m").removeClass("on");
            });
        });
    }
  </script>
</head>
<body>
<%@ include file="city_header2.jsp" %>

    <section id="res_sec">
        <div class="sec">
            <div id="main">
                <fieldset id="form1">
                    <legend>미니버스 예약하기</legend>
                    <div id="selector">
                        <label for="datepic">일&nbsp;정</label> 
                        <input type="text" id="datepic" class="selec">
                        <input type="button" name="real" id="real" value="배차 현황" class="btn_1">
                    </div>

                    <div id="selector"> 
                        <label for="line">코스선택</label> 
                        <select name="line" id="line" class="selec" onchange="category(this)">
                            <option value="0">라인선택</option>
                            <option value="red">레드라인</option>
                            <option value="blue">블루라인</option>
                            <option value="green">그린라인</option>
                            <option value="orange">오렌지라인</option>
                        </select>
                        <input type="button" name="info" id="info" class="btn_1" value="코스정보">
                        </div>

                    <div id="selector">
                    <label for="start">출발지</label> 
                    <select name="start" id="start" class="selec">
                        <option value="">정류장 선택</option>
                    </select>
                    <label for="s_time" id="s_label">시간</label> 
                    <select name="s_time" id="s_time" class="selec">
                        <option value="0">출발 시간</option>
                        <option value="9">9:00</option>
                        <option value="15">15:00</option>
                    </select>
                    </div>

                    <div id="selector">
                        <label for="many">인원수</label> 
                        <select name="many_ad" id="many_ad" class="selec1">
                            <option value="0">성인</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                        <label for="many">명</label> 
                        <select name="many_ch" id="many_ch" class="selec1">
                            <option value="0">아동</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                        <label for="many">명</label> 
                        </div>
                        <div id="selector">
                            <label for="seat">좌석선택</label>
                            <input type="button" name="seatz" id="seat" value="실시간 현황" class="btn_1">
                        </div>
                        <div id="selector">
                            <label for="price">결제금액</label>
                            <input type="text" name="price" id="price" class="selec" value="0" readonly>
                            <label for="price">원</label>
                        </div>
                        <div id="selector">
                            <label for="name">아이디</label>
                            <input type="text" name="id" id="id" class="selec" value="${sessionScope.id }" readonly>
                            <label for="tel_m" id="s_label">전화번호</label>
                            <input type="text" name="tel_m" id="tel_m" class="selec" value="${sessionScope.tel }"readonly>
                        </div><br><br><hr>

                        <div id="selector">
                            <input type="submit" name="reser" id="reser" class="btn_1" value="예약하기">
                            <input type="reset" name="reset" id="reset" class="btn_1" value="초기화">
                             <input type="hidden" name="seatFlag" id="seatFlag"  value="0">
                              <input type="hidden" name="seatFlag2" id="seatFlag2"  value="0">
                        </div>
                </fieldset>

                <div id="mo_bg"></div>

                <div id="mo_box"class="mo_box">
                    <div id="mo_closer" class="mo_closer">X</div>
                    <div id="mo_img">
                        <img src="img/citytour_map.jpg" width="675px" alt="코스정보사진">
                    </div> 
                </div>
                
                <div id="mo_box2"class="mo_box">
                	<div id="mo_closer2"class="mo_closer">X</div>
                    <div id="selec_2">
                    	<div id="selected_s">
                    	<input type="button" name="selec_s" id="selec_s" value="선택완료" class="seat_sec">
                    	</div>
                    </div>
                   
                    <div id="mo_seat">
                        <div id="seat_1">
                            <input type="button" name="seat_s" id="seat_s" value="운전석" class="btn_s2">
                            <input type="button" name="seat_s" id="seat_s" value="출입문" class="btn_s3">
                        </div>
                        <div id="seat_re">
                        <div id="seat_1">
                            <input type="button" name="seat1" id="0" value="1" class="btn_s" >
                            <input type="button" name="seat2" id="0" value="2" class="btn_s" >
                            <input type="button" name="seat3" id="0" value="3" class="btn_s1" >
                        </div>
                        <div id="seat_1">
                            <input type="button" name="seat4" id="0" value="4" class="btn_s" >
                            <input type="button" name="seat5" id="0" value="5" class="btn_s" >
                            <input type="button" name="seat6" id="0" value="6" class="btn_s1" >
                        </div>
                        <div id="seat_1">
                            <input type="button" name="seat7" id="0" value="7" class="btn_s" >
                            <input type="button" name="seat8" id="0" value="8" class="btn_s" >
                            <input type="button" name="seat9" id="0" value="9" class="btn_s1">
                        </div>
                        <div id="seat_1">
                            <input type="button" name="seat10" id="0" value="10" class="btn_s" >
                            <input type="button" name="seat11" id="0" value="11" class="btn_s" >
                            <input type="button" name="seat12" id="0" value="12" class="btn_s1">
                        </div>
                        </div>
                    </div> 
                </div>

                <div id="mo_box3"class="mo_box">
                    <div id="mo_closer3"class="mo_closer">X</div>
                    <div id="mo_log">
                    	<div id="log_d">
                    	<h3>로그인</h3>
                    	<br><hr><br>
                            <ul><li>
                                    <label for="id">아이디</label>
                                    <input type="text" name="log_id" id="log_id" class="logid"><br> 
                                </li>
                                <li>
                                    <label for="pw">비밀번호</label>
                                    <input type="password" name="log_pw" id="log_pw" class="logpw">
                                </li></ul>
                    	<input type="button" id="log_btn" value="로그인"class="log_btn">
                        </div>
                    </div> 
                </div>

                <div id="mo_box4"class="mo_box">
                    <div id="mo_closer4"class="mo_closer">X</div>
                    <div id="mo_reg">
                    	<div id="reg_d">
                    	<h3>회원가입</h3><br>
                    		<form name="frm" id="f01">
							<table id="tbl1" border="1">
								<tr><th>id</th><td><input type="text" name="reg_id"id="reg_id"class="selec_reg"style="border:0px" required ></td></tr>
								<tr><td colspan="3"><button type="button" style="width:140px; height:30px" onclick="return idcheck()"> 아이디 중복확인</button></td></tr>
								
								<tr><td colspan="3"><input type="text" name="id_check" id="id_check" value="" style="width:240px; height:40px;border:0px"class="selec" readonly></td></tr>
								<tr><td><input type="hidden" name="flag3" value="0" style="border:0px" readonly></td></tr>
								
								<tr><th>pw</th><td><input type="password" name="reg_pw"id="reg_pw"class="selec_reg" style="border:0px"required ></td></tr>
								<tr><th>name</th><td><input type="text" name="reg_name"id="reg_name"class="selec_reg" style="border:0px"required ></td></tr>
								<tr><th>tel</th><td><input type="text" name="reg_tel"id="reg_tel"class="selec_reg"style="border:0px" required ></td></tr>
								<!-- <tr><td colspan="2"><input type="button" id="reg_btn" class="btn_1"value="회원가입">
								<input type="reset" class="btn_1"value="초기화"></td></tr>   -->
							</table>
								<input type="button" id="reg_btn" class="reg_btn"value="회원가입">&nbsp;&nbsp;&nbsp;
								<input type="reset" class="reg_btn"value="초기화">
							</form>
                        </div>
                    </div> 
                </div>
                
			    <div id="mo_box5"class="mo_box">
                    <div id="mo_closer5"class="mo_closer">X</div>
                    <div id="mo_showbus">
                    	<div id="show_b">
                    		<h3 style="margin-top:30px">현재 운행하는 미니버스 배차 현황</h3>
							<table border="1" id="tbl2">
								<thead>
									<tr><th>운행명</th><th>출발일자</th><th>노선명</th><th>배차명</th><th>출발정류장</th><th>출발시간</th></tr>
								</thead>
								<tbody id="tbody">
								
								</tbody>
							</table>
                        </div>
                    </div> 
                </div>
                
                
            </div>
        </div>
    </section>

<%@ include file="city_footer.jsp" %>
<script>
	const reser = document.querySelector("#reser");
	reser.addEventListener('click', reservation);
	
    const adult = document.querySelector("#many_ad");
    adult.addEventListener('change', check_many);
    const child = document.querySelector("#many_ch");
    child.addEventListener('change', check_many);

    const reset = document.querySelector("#reset");
    reset.addEventListener('click',reset_f);

    const closer = document.querySelector('#mo_closer');
    closer.addEventListener('click',c);
    const closer2 = document.querySelector('#mo_closer2');
    closer2.addEventListener('click',c2);
    const closer3 = document.querySelector('#mo_closer3');
    closer3.addEventListener('click',c3);
    const closer4 = document.querySelector('#mo_closer4');
    closer4.addEventListener('click',c4);
    const closer5 = document.querySelector('#mo_closer5');
    closer5.addEventListener('click',c5);

    const info = document.querySelector("#info");
    info.addEventListener('click',info_img);
    const seat =document.querySelector('#seat');
    seat.addEventListener('click',seat_img);
    
	const datepic = document.querySelector("#datepic");
	
    const line = document.querySelector("#line");
    line.addEventListener('change', line_reset);
    
    const start = document.querySelector("#start");
    const s_time = document.querySelector("#s_time");
    s_time.addEventListener('change', s_time_reset);
    
    const price_v = document.querySelector("#price");
    
    const id = document.querySelector("#id");
    const tel_m = document.querySelector("#tel_m");
    
    const selec_s = document.querySelector("#selec_s");
    selec_s.addEventListener('click',selec_f);
    
    const seat_re = document.querySelector("#seat_re");
    seat_re.addEventListener('click',seat_re_f);
    
    const log_btn = document.querySelector("#log_btn");
    log_btn.addEventListener('click',logMember);
    
    const reg_btn = document.querySelector("#reg_btn");
    reg_btn.addEventListener('click',regMember);
    
    const seatFlag = document.querySelector("#seatFlag");
    const seatFlag2 = document.querySelector("#seatFlag2");
    
    const real = document.querySelector("#real");
    real.addEventListener('click',showbus);
   
    
function showbus(){
	mo_bg.style.display="block";mo_box5.style.display="block";
	const tbody = document.querySelector("#tbody");
	tbody.replaceChildren();
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function() {
		let jsonStr = this.responseText; 
		let obj = JSON.parse(jsonStr);
		
		for(let i = 0; i < obj.length; i++){ 
			tbody.innerHTML += '<tr><td>' + obj[i].driveid + '</td><td>' 
			+ obj[i].r_date + '</td><td>' + obj[i].course + '</td><td>' + obj[i].busno + '</td><td>'
			+ obj[i].start_st + '</td><td>' + obj[i].s_time + '</td></tr>';
			}
	  	}
	xhttp.open("GET", "ShowBusServlet",true);  
	xhttp.send();
}
    
function reservation(){
	if(id.value==""){
		alert("로그인을 하셔야 예약이 가능합니다.");
		return;
	}
	const xhttp = new XMLHttpRequest();
	
	let r_id = id.value;
	let r_datepic = datepic.value;
	let r_line = line.value;
	let r_start = start.value;
	let r_s_time = s_time.value;
	let r_many_ad = many_ad.value;
	let r_many_ch = many_ch.value;
	let r_price_v = price_v.value;
	let r_seat = arr;
	if(check2()){
	xhttp.onload = function() {
			alert(this.responseText);
			reset_f();
			location.reload();
	  	}
		xhttp.open("POST", "UpdateReserServlet",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
		let data = "id=" + r_id + "&datepic=" + r_datepic + "&course=" + r_line 
		+ "&start_st=" + r_start + "&s_time=" + r_s_time + "&many_ad=" + r_many_ad + "&many_ch=" + r_many_ch + "&price_v=" + r_price_v
		+ "&seat=" + r_seat;
		xhttp.send(data);
	}else{
		
	}
}

function selec_f(){
	let ch = document.querySelector("#many_ch").value;
	let ad = document.querySelector("#many_ad").value;

    let cnt = 0;
    for (var i = 0; i < arr.length; i++) {
    	if(arr[i] == 0){
    		cnt++;
    	}
    }
    if(cnt!="12"){
    	document.querySelector("#seatFlag").value = "1";
    }
    if(12-parseInt(cnt) != parseInt(ch)+parseInt(ad)){
    	alert("인원수와 좌석수가 일치하지 않습니다. 확인해 주세요.");
    	document.querySelector("#seatFlag").value = "0";
    }else{
    	document.querySelector("#seatFlag").value = "1";
    	mo_bg.style.display="none";mo_box2.style.display="none";
    }
}

function logMember(){
	const xhttp = new XMLHttpRequest();
	
	let log_id = document.querySelector("#log_id").value;
	let log_pw = document.querySelector("#log_pw").value;
	
	 xhttp.onreadystatechange = function() {
		 if (this.readyState == 4 && this.status == 200) {
			alert(this.responseText);
			mo_bg.style.display="none";mo_box3.style.display="none";
			location.reload();
		 }
	  }
	xhttp.open("POST", "LoginServlet",true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	let data = "id=" + log_id + "&pw=" + log_pw;
	xhttp.send(data);
	
}

function regMember() {
	const xhttp = new XMLHttpRequest();
	
	let reg_id = document.querySelector("#reg_id").value;
	let reg_pw = document.querySelector("#reg_pw").value;
	let reg_name = document.querySelector("#reg_name").value;
	let reg_tel = document.querySelector("#reg_tel").value;
	if(check()){
		xhttp.onload = function() {
			alert(this.responseText);
			mo_bg.style.display="none";mo_box4.style.display="none";
			location.reload();
	  	}
		xhttp.open("POST", "regMember.do",true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
		let data = "id=" + reg_id + "&pw=" + reg_pw + "&name=" + reg_name + "&tel=" + reg_tel;
		xhttp.send(data);
	}else{
	}
}
    
function check_many(){
    let adult_v = parseInt(document.querySelector("#many_ad").value);
    let child_v = parseInt(document.querySelector("#many_ch").value);
    price_v.value = adult_v*25000+child_v*15000;
}

function reset_f(){
    datepic.value="";
    line.value="0";
    start.value="";
    s_time.value="0";
    many_ad.value="0";
    many_ch.value="0";
    price_v.value="0";
} 

function info_img(){
    mo_bg.style.display="block";mo_box.style.display="block";
}

function s_time_reset(){
	resetSeat();
}
function line_reset(){
	resetSeat();
}
function resetSeat(){
	let cnt = 0;
	let arr = ['0','0','0','0','0','0','0','0','0','0','0','0']; 
	let s1 = document.querySelector("input[name='seat1']");
	let s2 = document.querySelector("input[name='seat2']");
	let s3 = document.querySelector("input[name='seat3']");
	let s4 = document.querySelector("input[name='seat4']");
	let s5 = document.querySelector("input[name='seat5']");
	let s6 = document.querySelector("input[name='seat6']");
	let s7 = document.querySelector("input[name='seat7']");
	let s8 = document.querySelector("input[name='seat8']");
	let s9 = document.querySelector("input[name='seat9']");
	let s10 = document.querySelector("input[name='seat10']");
	let s11 = document.querySelector("input[name='seat11']");
	let s12 = document.querySelector("input[name='seat12']");
	
	s1.style.backgroundColor="rgb(63, 176, 246)";
	s1.disabled = false;
	s2.style.backgroundColor="rgb(63, 176, 246)";
	s2.disabled = false;
	s3.style.backgroundColor="rgb(63, 176, 246)";
	s3.disabled = false;
	s4.style.backgroundColor="rgb(63, 176, 246)";
	s4.disabled = false;
	s5.style.backgroundColor="rgb(63, 176, 246)";
	s5.disabled = false;
	s6.style.backgroundColor="rgb(63, 176, 246)";
	s6.disabled = false;
	s7.style.backgroundColor="rgb(63, 176, 246)";
	s7.disabled = false;
	s8.style.backgroundColor="rgb(63, 176, 246)";
	s8.disabled = false;
	s9.style.backgroundColor="rgb(63, 176, 246)";
	s9.disabled = false;
	s10.style.backgroundColor="rgb(63, 176, 246)";
	s10.disabled = false;
	s11.style.backgroundColor="rgb(63, 176, 246)";
	s11.disabled = false;
	s12.style.backgroundColor="rgb(63, 176, 246)";
	s12.disabled = false;
}	

function seat_img(){
	const xhttp = new XMLHttpRequest();
	let r_line = line.value;
	let r_s_time = s_time.value;
	let r_datepic = datepic.value;
	
	let seatFlag2 = document.querySelector("#seatFlag2");
	seatFlag2.value = "1";
	
	let s1 = document.querySelector("input[name='seat1']");
	let s2 = document.querySelector("input[name='seat2']");
	let s3 = document.querySelector("input[name='seat3']");
	let s4 = document.querySelector("input[name='seat4']");
	let s5 = document.querySelector("input[name='seat5']");
	let s6 = document.querySelector("input[name='seat6']");
	let s7 = document.querySelector("input[name='seat7']");
	let s8 = document.querySelector("input[name='seat8']");
	let s9 = document.querySelector("input[name='seat9']");
	let s10 = document.querySelector("input[name='seat10']");
	let s11 = document.querySelector("input[name='seat11']");
	let s12 = document.querySelector("input[name='seat12']");

	if(check3()){
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				let jsonStr = this.responseText; 
				if(jsonStr=="false"){
					alert("선택하신 일자에 배정된 버스가 없습니다. 배차정보를 확인해 보세요.");
					return;
				}else{
					let obj = JSON.parse(jsonStr);

					for(let i = 0; i < obj.length; i++){
						if(obj[i] == s1.value){
							s1.style.backgroundColor="gray";
							s1.disabled = "disabled";
						}else if(obj[i] == s2.value){
							s2.style.backgroundColor="gray";
							s2.disabled = "disabled";
						}else if(obj[i] == s3.value){
							s3.style.backgroundColor="gray";
							s3.disabled = "disabled";	
						}else if(obj[i] == s4.value){
							s4.style.backgroundColor="gray";
							s4.disabled = "disabled";
						}else if(obj[i] == s5.value){
							s5.style.backgroundColor="gray";
							s5.disabled = "disabled";
						}else if(obj[i] == s6.value){
							s6.style.backgroundColor="gray";
							s6.disabled = "disabled";	
						}else if(obj[i] == s7.value){
							s7.style.backgroundColor="gray";
							s7.disabled = "disabled";	
						}else if(obj[i] == s8.value){
							s8.style.backgroundColor="gray";
							s8.disabled = "disabled";
						}else if(obj[i] == s9.value){
							s9.style.backgroundColor="gray";
							s9.disabled = "disabled";
						}else if(obj[i] == s10.value){
							s10.style.backgroundColor="gray";
							s10.disabled = "disabled";
						}else if(obj[i] == s11.value){
							s11.style.backgroundColor="gray";
							s11.disabled = "disabled";					
						}else if(obj[i] == s12.value){
							s12.style.backgroundColor="gray";
							s12.disabled = "disabled";
						}
					}
					mo_bg.style.display="block";mo_box2.style.display="block";
		 		}
				replaceChildren();
			}	
	  	}
	}
	xhttp.open("POST", "SelectedSeatServlet",true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	let data = "course=" + r_line + "&s_time=" + r_s_time + "&datepic=" + r_datepic;
	xhttp.send(data);
}

function c(){
    mo_bg.style.display="none";mo_box.style.display="none";
}
function c2(){
    mo_bg.style.display="none";mo_box2.style.display="none";
//    location.reload();
}
function c3(){
    mo_bg.style.display="none";mo_box3.style.display="none";
}
function c4(){
    mo_bg.style.display="none";mo_box4.style.display="none";
} 
function c5(){
	mo_bg.style.display="none";mo_box5.style.display="none";
} 

function category(e) {
	let red_line = ["부산역","UN 기념공원","용호만 유람선터미널","광안리 해수욕장","마린시티","해운대 해수욕장","벡스코"];
	let blue_line = ["용호만 유람선터미널","해운대 해수욕장","송정 해수욕장","해동용궁사","아난티코브","오시리아 테마파크","국립부산과학관"];
	let green_line = ["부산역","흰여울 문화마을","태종대","오륙도 스카이워크","용호만 유람선터미널","송도 해수욕장","BIFF광장"];
    let orange_line = ["부산역","송도 해수욕장","감천 문화마을","다대포 해수욕장","부네치아 장림항","낙동강하구 에코센터","국제시장"];
	let target = document.getElementById("start");
	if(e.value == "red"){
        var d = red_line;
    }else if(e.value == "blue"){ 
        var d = blue_line;
    }else if(e.value == "green"){
        var d = green_line;
    }else if(e.value == "orange") {
        var d = orange_line;
    }
	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
        opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

let arr = ['0','0','0','0','0','0','0','0','0','0','0','0']; 
function seat_re_f(e){
	if(e.target.value==="1"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[0]=1;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[0]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="2"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[1]=2;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[1]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="3"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[2]=3;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[2]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="4"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[3]=4;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[3]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="5"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[4]=5;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[4]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="6"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[5]=6;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[5]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="7"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[6]=7;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[6]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="8"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[7]=8;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[7]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="9"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[8]=9;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[8]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="10"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[9]=10;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[9]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="11"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[10]=11;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[10]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}else if(e.target.value==="12"){
		if(e.target.id==="0"){
			e.target.id="1";
			arr[11]=12;
			e.target.style.backgroundColor="blue";
		}else if(e.target.id==="1"){
			e.target.id="0";
			arr[11]=0;
			e.target.style.backgroundColor="rgb(63, 176, 246)";
		}
	}
}

function check(){
	if(document.frm.reg_id.value == ""){
		alert("아이디가 입력되지 않았습니다!");
		document.frm.reg_id.focus();
		return false;
	} else if(document.frm.reg_pw.value == ""){
		alert("비밀번호가 입력되지 않았습니다!");
		document.frm.reg_pw.focus();
		return false;
	} else if(document.frm.reg_name.value == ""){
		alert("이름이 입력되지 않았습니다!");
		document.frm.reg_name.focus();
		return false;
	} else if(document.frm.reg_tel.value == ""){
		alert("연락처가 입력되지 않았습니다!");
		document.frm.reg_tel.focus();
		return false;
	} else if(document.frm.flag3.value != "1"){
		alert("아이디 중복확인을 하세요.");
		return false;
	} else {
		return true;
	}
}

function idcheck(){
	if(document.frm.reg_id.value == ""){
		alert("아이디를 입력해주세요.");
		return false;
	}
	let id = document.getElementById("reg_id").value;
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		let result = this.responseText;
		let msg = "";
		if(result == 1){
			msg = "이미 사용중인 아이디 입니다.";
			document.frm.flag3.value = 0;
			document.getElementById("id_check").style.color="red";
		} else{
			msg = "사용 가능한 아이디 입니다.";
			document.frm.flag3.value = 1;
			document.getElementById("id_check").style.color="blue";
		}
		document.getElementById("id_check").value = msg;
	}
	xhttp.open("GET", "IdCheckServlet?id="+id, true);
	xhttp.send();
}
 
function check2(){
	let datepic1 = document.querySelector("#datepic").value;
	let line1 = document.querySelector("#line").value;
	let s_time1 = document.querySelector("#s_time").value;
	let seatFlag = document.querySelector("#seatFlag").value;
	let seatFlag2 = document.querySelector("#seatFlag2");
	let adult1 = document.querySelector("#many_ad").value;
	let child1 = document.querySelector("#many_ch").value;

	if(datepic1 == ""){
		alert("예약일이 선택되지 않았습니다!");
		return false;
	} else if(line1 == "0"){
		alert("코스가 선택되지 않았습니다!");
		return false;
	} else if(s_time1 == "0"){
		alert("출발시간이 선택되지 않았습니다!");
		return false;
	} else if((adult1 == "0") && (child1 == "0")){
		alert("인원수가 입력되지 않았습니다!");
		return false;
	} else if((seatFlag == "0") || (seatFlag2 == "0")){
		alert("좌석이 선택되지 않았습니다!");
		return false;
	} else {
		return true;
	}
}

function check3(){
	let datepic1 = document.querySelector("#datepic").value;
	let line1 = document.querySelector("#line").value;
	let s_time1 = document.querySelector("#s_time").value;
	let adult1 = document.querySelector("#many_ad").value;
	let child1 = document.querySelector("#many_ch").value;

	if(datepic1 == ""){
		alert("예약일이 선택되지 않았습니다!");
		return false;
	} else if(line1 == "0"){
		alert("코스가 선택되지 않았습니다!");
		return false;
	} else if(s_time1 == "0"){
		alert("출발시간이 선택되지 않았습니다!");
		return false;
	} else if((adult1 == "0") && (child1 == "0")){
		alert("인원수가 입력되지 않았습니다!");
		return false;
	} else {
		return true;
	}
}

</script>
</body>
</html>