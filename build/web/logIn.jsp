<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Match Maker</title>
	<link rel="stylesheet" type="text/css" href="css/navigationBar.css">
	<link rel="stylesheet" type="text/css" href="css/logIn.css">
<meta charset="utf-8">

<script type="text/javascript" src="js/validator.js"></script>
</head>

<body>
<div class="wrapper">
	
     <div class="wrapper-over">
   
 <!--navigation-bar-->
 <div class="nav-holder">
 	<ul class="topnav">
    	<li class="topnav-li">
        	<img src="images/index2.png">
        </li>
        <li class="topnav-li">
        	<a class="topnav-a">Match Maker
            </a>
        </li>
        <li class="topnav-li">
        	<a class="topnav-a" style="font-size:16px;">Match Maker
            </a>
        </li>
        
    </ul>
 </div><!--nav-holder-->
 
 <!--/navigation-bar-->
 <div class="row">
 <div class="col-5" style="padding: 50px 0px 0px 0px">
  <p class="welcome-text">Welcome to Match Maker Network World</p>
  <p class="welcome-text welcome-text2" >we are new and emerging Networking website we are new and Social Networking website we are new and emerging Networking website we are new and emerging  website we are new and emerging Networking website we are new and emerging Networking website</p>
 <div class="row" style="padding:30px 35px 0px 35px;">
     <a class="logIn-btn">Registered already!</a>
    </div><!--/row-->
</div><!--/col-5-->

 <div class="col-5 reg-pad">
 	<div class="registor-pad">
            <form name="Registration" action="process.jsp" method="post" onsubmit="return regBtn()">
    	<div class="registor-text">
        	<p>Register to Match Maker</p>
        </div><!--registor-text-->
        <div class="row">
        	<div class="registor-50">
            	<input type="text" class="text" placeholder="First Name" onkeyup="FirstNameValidator()" name="Fname" id="FnameId">
            	<p id="Fname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
          	<div class="registor-50">
          		 	<input type="text" class="text" placeholder="Last Name" onkeyup="LastNameValidator()" name="lname" id="LnameId">
          		 	<p id="Lname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
        </div><!--row-->
        <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" placeholder="Your Email" style="width: 415px;"  onblur="EmailValidator()" name="email" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" placeholder="Contact" style="width: 415px;"  name="contact" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        <div class="row" style="padding:13px 27px;">
            	<input type="Password" class="text" placeholder="Your Password" style="width: 415px;"  onblur="PassValidator()" name="pass" id="passId">
            	<p id="pass-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
         <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Gender</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Caste</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="caste">
                    <option value="general">General</option>
                    <option value="obc">OBC</option>
                    <option value="st">ST</option>
                    <option value="sc">SC</option>
                    <option value="other">Other</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Religion</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="religion">
                    <option value="hindu">Hindu</option>
                    <option value="muslim">Muslim</option>
                    <option value="sikh">Sikh</option>
                    <option value="christian">Christian</option>                    
                    <option value="jain">Jain</option>
                    <option value="other">Other</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Dosh</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="dosh">
                    <option value="no">No</option>
                    <option value="yes">Yes</option>
                    <option value="don't know">Don't know</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Marital Status</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="maritalStatus">
                    <option value="never married">Never Married</option>
                    <option value="widow">widow</option>
                    <option value="divorced">divorced</option>
                    <option value="awaiting divorce">Awaiting divorce</option>                    
                    <option value="jain">Jain</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
       
        
        <div class="row">
        	<div class="registor-50">
            	<input type="text" class="text" placeholder="Sub Caste" onkeyup="FirstNameValidator()" name="subCaste" id="FnameId">
            	<p id="Fname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
          	<div class="registor-50">
          		 	<input type="text" class="text" placeholder="Height in ft" name="height" id="LnameId">
          		 	<p id="Lname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
        </div><!--row-->
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Family status</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="familyStatus">
                    <option value="middle class">Middle class</option>
                    <option value="upper middle class">Upper middle class</option>
                    <option value="rich">Rich</option>
                    <option value="affluent">Affluent</option>   
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Family type</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="familyType">
                    <option value="joint">Joint</option>
                    <option value="nuclear">Nuclear</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">State</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
                    <select class="text" style="width: 200px;height: 50px" name="state">
                    <option value="madhya pradesh">Madhya Pradesh</option>
                    <option value="uttar pradesh">Uttar Pradesh</option>
                    <option value="gujrat">Gujrat</option>
                    <option value="maharastra">Maharastra</option>
                    <option value="chattisgrah">Chattisgrah</option>
                    <option value="rajasthan">Rajasthan</option>
                    <option value="haryana">Haryana</option>
                    <option value="jammu and kashmir">Jammu and Kashmir</option>
            	</select>
            </div>
        	</div>
        </div><!--row-->
        
        <div class="row">
        	<div class="registor-50">
            	<input type="text" class="text" placeholder="Weight in kg" name="weight" id="FnameId">
            	<p id="Fname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
          	<div class="registor-50">
          		 	<input type="text" class="text" placeholder="City" name="city" id="LnameId">
          		 	<p id="Lname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
        </div><!--row-->
        
        
        
        <div class="row">
        	<div class="registor-50">
            	<input type="text" class="text" placeholder="Age" name="age" id="FnameId">
            	<p id="Fname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
            </div>
          	
        </div><!--row-->
        
        
        
        
        
        <div class="row" style="padding:13px 27px;margin-bottom: 30px">
        	<div style="float: left;">
        		<input type="checkbox" onclick="ChkboxValidator()" checked="checked">
        	</div>
        	<div style="float: left;">
        		<p class="check-text">I accept the <a style="color: #7C5AC2; cursor: pointer;">terms and conditions</a> of website</p>
        	</div>
        </div><!--/row-->
       
        <div class="row" style="padding:30px 35px;">
        	<p id="regBtn-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
                <input type="hidden" name="signType" value="signUp">
                <input type="submit" class="regComplete"  id="reg-a" value="Complete Registration!">

         </div><!--/row-->
     </form>
    </div><!--registor-pad-->
  </div><!--/col-5-->

</div><!--row-->

<div class="row">
  <div class="col-5" style="padding: 50px 0px">
 	<div class="registor-pad">
            <form name="loginForm" action="process.jsp" method="post" onsubmit="return loginBtn()" >
    	<div class="registor-text">
        	<p>lOG IN</p>
        </div><!--registor-text-->
       
        <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" placeholder="Your Email" style="width: 415px;" onblur="EmailValidator1()" name="email1" id="emailId1">
            	<p id="email1-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        <div class="row" style="padding:13px 27px;">
            <input type="text" class="text" placeholder="Your Password" style="width: 415px;" name="pass1">
        </div><!--row-->
  
        <div class="row" style="padding:30px 35px;">
            <input type="hidden" name="signType" value="logIn">
            <input type="submit" class="regComplete"  id="logId" value="Log In">
         </div><!--/row-->
        </form>
    </div><!--registor-pad-->

 </div><!--col-5-->


  <div class="col-5">
  	<div style="width: 80%; margin: auto;">
     <p class="welcome-text log-text">Glad to see you back!</p>
 	</div>
 </div><!--col5-->
</div><!--row-->
    </div><!--/wrapper-over-->
</div><!--/wrapper-->

<script defer src="js/fontawesome-all.js"></script>

</body>
</html>