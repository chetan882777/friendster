var x =[1,1,1,1,1];
var cbox = 2;
var y = 0;
function FirstNameValidator()
{
	var size;
	var check;
	var i=1;
	var flag=0;
	var val = document.Registration.Fname.value;
	size = val.length - 1;
	for(i=0;i<=size;i++)
	{	
		check = val.charCodeAt(i);
		
		if(!((check >= 65 && check <= 90) || (check >= 97 && check <= 122)))
		{
			flag = 1;
		}
               
	}
	if(flag == 1)
	{
		document.getElementById("Fname-text-print").innerHTML ="only characters";
		document.getElementById("FnameId").style.borderBottom = "2px solid red";	
		x[0] = 0;
	}
	else{
			document.getElementById("Fname-text-print").innerHTML ="";
		document.getElementById("FnameId").style.borderBottom = "";
		x[0] = 1;
		}
}

function LastNameValidator()
{
	var size;
	var check;
	var i=1;
	var flag=0;
	var val = document.Registration.lname.value;
	size = val.length - 1;
	for(i=0;i<=size;i++)
	{	
		check = val.charCodeAt(i);
		
		if(!((check >= 65 && check <= 90) || (check >= 97 && check <= 122)))
		{
			flag = 1;
		}
	}
	if(flag == 1)
	{
		document.getElementById("Lname-text-print").innerHTML ="only characters";
		document.getElementById("LnameId").style.borderBottom = "2px solid red";	
			x[1] = 0;
	}
	else{
			document.getElementById("Lname-text-print").innerHTML ="";
		document.getElementById("LnameId").style.borderBottom = "";
		x[1] = 1;
		}
}

function EmailValidator()
{
	var val = document.Registration.email.value;
	var atposition = val.indexOf("@");
	var dotposition = val.lastIndexOf(".");
	if(atposition<1 || dotposition<atposition+2 || dotposition+2>=val.length)
	{
		document.getElementById("email-text-print").innerHTML ="Enter valid E-mail Address";
		document.getElementById("emailId").style.borderBottom = "2px solid red";
                x[2] = 0;
	}
	else{
			document.getElementById("email-text-print").innerHTML ="";
		document.getElementById("emailId").style.borderBottom = "";
		x[2] = 1;
		}
}
function EmailValidator1()
{
	var val = document.loginForm.email1.value;
	var atposition = val.indexOf("@");
	var dotposition = val.lastIndexOf(".");
	if(atposition<1 || dotposition<atposition+2 || dotposition+2>=val.length)
	{
		document.getElementById("email1-text-print").innerHTML ="Enter valid E-mail Address";
		document.getElementById("emailId1").style.borderBottom = "2px solid red";	
		y=0;
	}
	else{
			document.getElementById("email1-text-print").innerHTML ="";
		document.getElementById("emailId1").style.borderBottom = "";
		y =1;
		}
}
function PassValidator()
{
	var val = document.Registration.pass.value;
	var len = val.length;
	if(len< 7)
	{
		document.getElementById("pass-text-print").innerHTML ="Your Password is too poor";
		document.getElementById("passId").style.borderBottom = "2px solid red";
                x[3] = 0;
	}
	else{
			document.getElementById("pass-text-print").innerHTML ="";
		document.getElementById("passId").style.borderBottom = "";
		x[3] = 1;
		}
}

function ChkboxValidator()
{
	var xz = document.Registration.chbox.checked;
	alert(xz);
	if(!xz)
	{	
			alert("worked");
			x[4] = 0;
			alert(x[4]);
			document.getElementById("regBtn-text-print").innerHTML ="Box must be checked";

	}
	else
	{
			x[4] = 1;
			document.getElementById("regBtn-text-print").innerHTML ="";
			
	}
}

function regBtn()
{	var i;
	var flag=0, check;
	for(i= 0;i<5;i++)
	{
		var check = x[i];
		if(check ==0)
		{
			flag = 1;
		}
	}
	if(flag == 1)
	{
		document.getElementById("regBtn-text-print").innerHTML ="Any of the field cannot be empty";
		document.getElementById("reg-a").style.backgroundColor = "red";
		return false;	}
            else
	{
		document.getElementById("regBtn-text-print").innerHTML ="";
		document.getElementById("reg-a").style.backgroundColor = "#7C5AC2";
		var final = confirm("Are sure to get registered");
		if(!final)
		{
			return false;
		}
		
		
	}
}
function loginBtn()
{
	
	if(y == 0)
	{
		document.getElementById("email1-text-print").innerHTML ="Enter valid E-mail Address";
		document.getElementById("emailId1").style.borderBottom = "2px solid red";	
		document.getElementById("logId").style.backgroundColor = "red";	
	}
	else{
			document.getElementById("email1-text-print").innerHTML ="";
		document.getElementById("emailId1").style.borderBottom = "";
		document.getElementById("logId").style.backgroundColor = "#7C5AC2";
		}
}