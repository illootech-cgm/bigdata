<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>네이버 로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<script>


  
  function statusChangeCallback(response) {
	  console.log('statusChangeCallback');
	    console.log(response);
	    if (response.status === 'connected') {
	        // Logged into your app and Facebook.
	        testAPI();
	      } else if (response.status === 'not_authorized') {
	        // The person is logged into Facebook, but not your app.
	        document.getElementById('status').innerHTML = 'Please log ' +
	          'into this app.';
	      } else {
	        // The person is not logged into Facebook, so we're not sure if
	        // they are logged into this app or not.
	        document.getElementById('status').innerHTML = 'Please log ' +
	          'into Facebook.';
	      }
	    }
  
  function checkLoginState() {
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	}

  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '222481278218600',
	      xfbml      : true,
	      version    : 'v2.8'
	    });
	    FB.AppEvents.logPageView();
	  };

	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "//connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));

  
  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.name);
	      alert('Thanks for logging in, ' + response.name + '!');
	      window.location="list";  
	    });
	  }
  
  
</script>


<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false" onlogin="checkLoginState();"></div>

<div id="status">
</div>
  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("GzCVlEJt8xhSJNcmFw_4", "http://192.168.1.18:8080/web/callBack");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 1,40);
  	naver_id_login.setDomain("http://192.168.1.18:8080/web/home");
  	naver_id_login.setState(state);
  	//naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
</html>