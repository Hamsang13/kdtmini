<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="css/m_style.css">
            <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">

            <link rel="stylesheet" href="../css/custom.css" />

            <script src="https://code.jquery.com/jquery-3.6.4.min.js"
                integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>sign</title>
        </head>

        <body>
            
            <!-- 메뉴바 ---------------------------------------------------------------------------------------------------- -->
            <div class="bg-header">
                <div class="container">
                    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-3 mycustom-header">
                        <a href="/" class="d-flex align-items-center col-md-2 mb-2 mb-md-0 text-dark text-decoration-none">
                        </a>

                        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
                        <li><a href="/tour" class="nav-link px-3 link-dark">관광지</a></li>
                        <li><a href="/tour?content_TypeId=15" class="nav-link px-3 link-dark">축제/공연</a></li>
                        <li><a href="/tour?content_TypeId=28" class="nav-link px-3 link-dark">레저</a></li>
                        </ul>

                        <c:if test="${sessionScope.mvo == null}">
                        <div class="col-md-3 text-end">
                            <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='login'">로그인</button>
                            <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='join'">회원가입</button>
                        </div>
                        </c:if>
                        <c:if test="${sessionScope.mvo != null}">
                        <div class="col-md-3 text-end">
                            <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/tour?isLogout=true'">로그아웃</button>
                        </div>
                        </c:if>
                    </header>
                </div>
            </div>
            <!-- 메뉴바 끝 -------------------------------------------------------------------------------------------------- -->

            <section class="container forms show-signup m_container">
                <div class="form signup">
                    <div class="form-content">
                        <p class="m_header">회원가입</header>
                        <form action="/common/join" method="post">
                            <div class="field input-field">
                                <input type="text" placeholder="Email" class="input" name = "j_email" id = "j_email">
                                <span id="j_box"></span> 
                            </div>

                            <div class="field input-field">
                                <input type="password" placeholder="Create password" class="password" name = "j_password" id = "j_password">
                            </div>
                            
                            <div class="field input-field">
                                <input type="password" placeholder="Confirm password" class="password" name = "j_confirmpassword" id = "j_confirmpassword">
                            </div>

                            <div class="field input-field">
                                <input type="text" placeholder="Nickname" class="input" name = "j_nickname" id = "j_nickname">
                            </div>

                            <div class="field button-field">
                                <button type="button" onclick="send(this.form)">일반 회원가입</button>
                            </div>
                        </form>

                        <div class="form-link">
                            <span>이미 계정을 갖고 계신가요? <a href="login" class="link login-link">Login</a></span>
                        </div>
                    </div>

                    <div class="line"></div>

                    <div class="media-options">
                        <a href="https://kauth.kakao.com/oauth/authorize?client_id=c691b066d7c57c4085e1fa5fc3e2c47b&redirect_uri=http://localhost:8080/kakao/join&response_type=code">
                            <img src="images/kakao_login.png">
                        </a>
                    </br>
                    </div>

                    <div class="media-options">
                        <a href="https://nid.naver.com/oauth2.0/authorize?client_id=6BPvD8rTeGLnG7fdps1C&redirect_uri=http://localhost:8080/naver/join&response_type=code&state=test">
                            <img src="images/naver_login.png">
                        </a>
                    </div>

                </div>
            </section>
            
            <body class="d-flex flex-column">
                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
                  <div class="container text-center">
                    <small>Copyright &copy; 2023 팀이름 </small>
                  </div>
                </footer>
            </body>
            <!-- JavaScript -->
            <script src="js/m_script.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script>
                function send(form){
                    let check1 = /^[a-zA-Z0-9]+@[a-z]+\.[a-zA-Z]{2,3}$/i;
                    let check2 = /^[a-zA-Z0-9]{8,}$/i;
                    
                    let j_email = $("#j_email").val();
                    let j_password = $("#j_password").val();
                    let j_confirmpassword = $("#j_confirmpassword").val();
                    let j_nickname = $("#j_nickname").val();
                    
                    if(j_email.trim().length < 1){
                        alert("이메일을 입력하세요");
                        $("#j_email").focus();
                        return;
                    }

                    if(!check1.test(j_email)){
                        alert("이메일 형식이 올바르지 않습니다.");
                        $("#j_email").focus();
                        return;
                    }

                    if(j_password.trim().length < 1){
                        alert("비밀번호를 입력하세요");
                        $("#j_password").focus();
                        return;
                    }
                    
                    if(!check2.test(j_password)){
                        alert("비밀번호는 8자 이상 입력해야 합니다.");
                        $("#j_password").focus();
                        return;
                    }
                    
                    if(j_confirmpassword.trim() != j_password.trim()){
                        alert("비밀번호가 다릅니다.");
                        $("#j_confirmpassword").focus();
                        return;
                    }
                    
                    if(j_nickname.trim().length < 1){
                        alert("닉네임을 입력하세요");
                        $("#j_nickname").focus();
                        return;
                    }
                    form.submit();
                }
                
                $(function(){
                    $("#j_email").bind("keyup", function(){
                        var str = $(this).val();
                        if(str.trim().length > 4){
                            $.ajax({
                                url: "/join/checkid",
                                type: "post",
                                data: {"email":str},
                                dataType:"json"
                            }).done(function(res){
                                if(res.chk == true){
                                    $("#j_box").html("&nbsp;사용가능");
                                }else{
                                    $("#j_box").html("&nbsp;사용불가능");
                                }
                            })
                        }else{
                            $("#j_box").html("");
                        }
                    });

                    if("${commjoin_fail}" == "commjoin_fail"){
                        alert("이미 가입된 이메일입니다.");
                        return;
                    }
                });
                
            </script>
        </body>

        </html>