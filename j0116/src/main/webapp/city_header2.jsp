<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        *{
            margin: 0;
            padding: 0;
            text-align: center; 
        }
        body{
            background-color: rgb(249, 249, 239);
        }
        .head{
            width: 1000px;
            margin: 0 auto;
            
            
        }
        #logo{
            width: 200px;
            height: 80px;
           
            float: left;
        }
        #log{
            width: 500px;
            height: 40px;
            
            margin-top: 40px;
            float: right;  
        }
        .inputed{
        	width:100px;
        	height:22px;
        }
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
            color: #000;
        }
        #main_nav{
        	clear: both;
        	width: 1000px;
       		padding-bottom: 10px;
     		border-bottom: 5px solid rgb(104, 103, 103);
     		display: flex;
    		justify-content: center;
			border:0px solid red;
			background-color: dodgerblue;
 		}
/*        #main_nav{
            clear: both;
            width: 1000px;
            height: 210px;
            
            padding-bottom: 10px;
            border-bottom: 5px solid rgb(104, 103, 103);
            background-image: url();
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;

        }
*/

        #main_nav > ul > li{
            float: left;
            width: 250px;
           margin-left: 25px;
            
        }
        #main_nav ul li:hover{
                 font-size: large;
        }

		#main_image{
		margin-top: 30px;
		}

        

/*
        #main_image{
            width: 800px;
            height: 150px;
            position: relative;
            left:100px;
            
        }
*/
        #main{
            margin-top: 30px;
        }

        #res_sec{
            display: flex;
            justify-content: center;
        }
        .sec{
            width: 1000px;
            height: 800px;
            
            display: flex;
            justify-content: center;
        }

        #form1{
            width: 700px;
            height: 450px;
            padding-top: 20px;
            background-color: rgb(245, 248, 250);

        }
        .chk{
            
            margin-left: 20px;
        }
        #info{
            width: 100px;
            height: 30px;
            margin-left: 10px;
        }

        #selector{
            width: 600px;
            height: 30px;
            margin-top: 15px;
            margin-left: 55px;
          /*  border: 1px solid rgb(45, 201, 248); */
        }
        .selec{
            width: 150px;
            height: 30px;
            margin-left: 10px;
            font-size: 15px;
        }
        .selec_reg{
            width: 150px;
            height: 40px;
            margin-left: 10px;
            font-size: 15px;
        }
       .logpw{
            width: 150px;
            height: 30px;
            margin-left: 10px;
            font-size: 15px;
        }
       .logid{
            width: 150px;
            height: 30px;
            margin-left: 26px;
            font-size: 15px;
        }
        .log_btn{
            width: 235px;
            height: 40px;
            margin-left: 5px;
            margin-top:20px;
            font-size: 15px;
        }
       .reg_btn{
            width: 100px;
            height: 40px;
            margin-top:10px;
            font-size: 15px;
        }
        .selec1{
            width: 80px;
            height: 25px;
            margin-left: 10px;
            font-size: 15px;
        }
        .btn_1{
            width: 100px;
            height: 30px;
            margin-left: 15px;
            font-size: 15px;
        }
        .seat_sec{
            width: 120px;
            height: 40px;
            margin-left: 243px;
            font-size: 15px;
        }
        #start{
            width: 162px;
        }



        footer{
            display: flex;
            justify-content: center;
        }
        .foot{
            width: 1000px;
            height: 150px;
            
        }
        #s_label{
            margin-left: 25px;
        }
        #mo_bg{
            display: none;
            width: 200%;
            height: 200%;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: gray;
            opacity: 50%;
        }
        .mo_box{
            position: absolute;
            background-color: white;
            text-align: center;
            
            overflow: auto;
        }
        #mo_box{
            display: none;
            width: 1000px;
            height: 600px;
            top: 18%;
            left: 25%;
        }
        #mo_box2{
            display: none;
            width: 450px;
            height: 550px;
            top: 18%;
            left: 40%;
      /*      background-image: url("img/seat.jpg");
            background-repeat: no-repeat;  */
        }
        #mo_box3{
            display: none;
            width: 400px;
            height: 320px;
            top: 40%;
            left: 40%;
        }
        #mo_box4{
            display: none;
            width: 400px;
            height: 410px;
            top: 40%;
            left: 40%;
        }
        #mo_box5{
            display: none;
            width: 650px;
            height: 450px;
            top: 30%;
            left: 35%;
            overflow: scroll;
        }
        #log_d{
        	margin: 0 auto;
            margin-top: 10px;

            width: 300px;
            height: 100px;
        	
        }
        .log{
            margin: 5px;
        }
        #tbody > tr > td {
        	height: 30px;
        	
        }

        /*
        #mo_reg{
        	width: 650px;
            height: 450px;
            display: flex;
            justify-content: center;
        }*/
        #f01{
        /* 	margin-left:70px; */
         	margin-bottom:40px;
        }

        #mo_seat{
            width: 280px;
            height: 400px;
            position: relative;
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom:10px;
            border:2px solid gray;
            
        }
        .btn_s{
            width: 50px; height: 50px;
            border-radius: 30%;
            cursor: pointer;
            background-color: rgb(63, 176, 246);
            color: #fff;
            margin: 2px;
            margin-top: 8px;
        }
        .btn_s1{
            width: 50px; height: 50px;
            border-radius: 30%;
            cursor: pointer;
            background-color: rgb(63, 176, 246);
            color: #fff;
            margin-left: 38px;
        }
        .btn_s2{
            width: 70px; height: 50px;
            border-radius: 40%;
            cursor: pointer;
            background-color: rgb(55, 96, 121);
            color: #fff;
            margin: 2px;
            margin-top: 8px;
            margin-bottom: 30px;
        }
        .btn_s3{
            width: 50px; height: 60px;
            border-radius: 30%;
            cursor: pointer;
            background-color: rgb(55, 96, 121);
            color: #fff;
            margin-left: 78px;
            margin-top: 25px;
            margin-bottom: 20px;
        }
        .mo_closer{
            width: 30px; height: 30px;
            background-color: red;
            color: white;
            border-radius: 10%;
            cursor: pointer;
            display: inline-block;
			padding:5px;
            position: sticky;
    /*       	position: absolute;  */
           	font-size:20px;
           	font-weight:bold;
            left: 100%;
            top:0px;
        }
        #selec_2{
            display: flex;
            position: relative;
            top: 10px;
        }
        

        #gnb {
            width: 600px;
            margin: 0 auto;
        }
        #gnb:after {
            content: "";
            display: block;
            clear: both;
        }
        #gnb .m {
            float: left;
            width: 120px;           
            text-align: center;
            position: relative;            
        } 
        #gnb .m > a {
            display: block;
            height: 40px;            
            line-height: 40px;
            font-size: 1.4em;
            font-weight: bold;
            
            
        }        
        #gnb .m.on > a {
            border-bottom: 4px solid #31c3f8;
            box-sizing: border-box;
        }     
        #gnb .m ul {
            position: absolute;
            left: 0;
            top: 40px;            
            width: 100%;
            background: #000;
            display: none;
        }        
        #gnb .m ul li a {
            display: block;
            color: #fff;
            padding: 12px 0;
            border-bottom: 1px solid #333;
        }
        #gnb .m ul li:last-child a{
            border: none;
        }
        #gnb .m ul li a:hover,
        #gnb .m ul li a:active,
        #gnb .m ul li a:focus {            
            background: #fff;
            color: #000;
        }
        #tbl1{
			text-align:center;
			margin: 0 auto;
			padding: 0 auto;
			border-collapse: collapse;
		}
		 #tbl2{
			text-align:center;
			margin-top:50px;
			margin-bottom:30px;
			margin-left:50px; 
	/*		margin-left:0 auto;   */
			margin-right:0 auto;
			border-collapse: collapse;
		}

    
</style>
</head>
<body>
    <header>
      	<div id="main_image">
			<br><h1>미니 버스 예약 사이트</h1>
		</div>
        <div class="head">
            <div id="logo"></div>
            <div id="log">
            <c:if test="${sessionScope.id != null }">
            <input type="text" name="loged" id="loged" class="inputed" value="${sessionScope.id }" readonly>
            <label for="loged">님이 로그인 중 |</label>
             <input type="button" name="logout" id="logout" class="btn_1" value="로그아웃">
             <script>
             const logout1 = document.querySelector("#logout");
             logout1.addEventListener('click',logoutMember);
             function logoutMember(){
            		const xhttp = new XMLHttpRequest();
            		xhttp.onreadystatechange = function() {
            		    if (this.readyState == 4 && this.status == 200) {
            		    	alert(this.responseText);
            				location.reload();
            		    }
            		}
            		xhttp.open("GET", "LogoutServlet",true);  
            		xhttp.send();
            	}
             </script>
             </c:if>
             <c:if test="${sessionScope.id == null }">
             <input type="button" name="login" id="login" class="btn_1" value="로그인">
             <input type="button" name="reg" id="reg" class="btn_1" value="회원가입">
             <script>
             const login = document.querySelector("#login");
             login.addEventListener('click',login_f);
             const reg1 = document.querySelector("#reg");
             reg1.addEventListener('click',reg_f);
             function login_f(){
            	    mo_bg.style.display="block";mo_box3.style.display="block";
            	}
             function reg_f(){
            	    mo_bg.style.display="block";mo_box4.style.display="block";
            	}
             </script>
             </c:if>
            </div>
        </div>
        <div class="head">
            <nav id="main_nav">
                <ul id="gnb">
                    <li class="m"><a href="#">사업 소개</a>
                        <ul>
                            <li><a href="#">사업 소개</a></li>
                            <li><a href="#">요금 정보</a></li>
                        </ul>
                    </li>
                    
                    <li class="m"><a href="#">버스 예약</a>
                        <ul>
                            <li><a href="#">버스 예약</a></li>
                            <li><a href="#">코스 정보</a></li>
                            <li><a href="#">정류장 안내</a></li>
                        </ul>
                    </li> 

                    <li class="m"><a href="#">관광 정보</a>
                        <ul>
                            <li><a href="#">관광 정보</a></li>
                        </ul>
                    </li>
                    
                    <li class="m"><a href="#">공지사항</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">게시판</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>