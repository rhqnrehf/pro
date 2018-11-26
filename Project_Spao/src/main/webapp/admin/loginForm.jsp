<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="/Project_Spao/admin/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Project_Spao/admin/common/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SPAO Admin Login</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>	
<!-- 순서에 유의 -->
<script type="text/javascript" src="/Project_Spao/admin/common/js/rsa.js"></script>
<script type="text/javascript" src="/Project_Spao/admin/common/js/jsbn.js"></script>
<script type="text/javascript" src="/Project_Spao/admin/common/js/prng4.js"></script>
<script type="text/javascript" src="/Project_Spao/admin/common/js/rng.js"></script>

<script type="text/javascript">  
	$(document).ready(function(){
		$('#loginPwdDiv').html('<span style="color:red;font-size:8pt">${error}</span>');
	});
    function login(){
		$('#loginIdDiv').empty();
		$('#loginPwdDiv').empty();
		
        var id = $("#USER_ID_TEXT");
        var pw = $("#USER_PW_TEXT");
    
        if(id.val() == ""){
        	$('#loginIdDiv').html('<span style="color:red;font-size:8pt">아이디를 입력하세요.</span>')
            id.focus();
            return false;
        }
        
        if(pw.val() == ""){
        	$('#loginPwdDiv').html('<span style="color:red;font-size:8pt">비밀번호를 입력하세요.</span>')
            pw.focus();
            return false;
        }
        
        // rsa 암호화
        var rsa = new RSAKey();
        rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());

        $("#USER_ID").val(rsa.encrypt(id.val()));
        $("#USER_PW").val(rsa.encrypt(pw.val()));
        
        id.val("");
        pw.val("");
        
        return true;
    }
</script>
</head>
<body>
	<br><br><br><br>
    <form class="form form-signup" name="frm" method="post" action="/Project_Spao/admin/login.do" onsubmit="return login()">
    	<div class="col-md-4 col-md-offset-4">
       <div class="panel panel-default">
           <div class="panel-body">
               <h3 class="text-center" style="color:black;">SPAO ADMIN</h3>
                   <div class="form-group">
				     <input type="hidden" name='RSAModulus'id="RSAModulus" value="${RSAModulus}"/>
				     <input type="hidden" name="RSAExponent" id="RSAExponent" value="${RSAExponent}"/>  
                       <div class="input-group">
                           <span class="input-group-addon" > &nbsp; ID &nbsp;&nbsp; </span>
                           <input type="text"  class="form-control" name="USER_ID_TEXT" id="USER_ID_TEXT" placeholder="아이디" />                           
                       </div>
                       <div id="loginIdDiv"></div>
                   </div>
                   
                   <div class="form-group">
                       <div class="input-group">
                           <span class="input-group-addon" >PWD</span>
                           <input type="password" class="form-control" name="USER_PW_TEXT" id="USER_PW_TEXT" placeholder="비밀번호" />
                       </div>
                       <div id="loginPwdDiv"></div> 
                   </div>                                     
                   <input type="hidden" id="USER_ID" name="USER_ID">
        		   <input type="hidden" id="USER_PW" name="USER_PW">
                   <input type="submit" id="loginBtn" class="btn btn-sm btn-primary btn-block" value="로그인"/>
                   <div id="loginDiv" style="text-align: center;"></div>
           </div>
       </div>
   </div>  
   </form>
</body>
</html>
