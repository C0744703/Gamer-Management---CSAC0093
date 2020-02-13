function passwordCheck()
{
	var pwd1=document.getElementById("password").value;
	var pwd2=document.getElementById("confirm_password").value;
	
	var tempStr1=[...pwd1];
	var tempStr2=[...pwd2];
	
	console.log(tempStr1);
	console.log(tempStr2);
	var offset=0, flag=0;
	while(offset<tempStr1.length && offset<tempStr2.length)
	{
		if(tempStr1[offset]!=tempStr2[offset]) 
		{
				flag=1;
				break;
		}
		offset++;
	}
	
	if(flag==1)
	{
		alert("Password should be Same");
	}
		
	//else document.getElementById("res").style.display=none;
}

function dobCheck()
{
	var data=document.getElementById("dob").value;
	var month=parseInt(data.substring(0,2));
	var day=parseInt(data.substring(3,5));
	var year=parseInt(data.substring(6,10));
	
	console.log(data);
	console.log(month);
	console.log(day);
	console.log(year);
}
function captcha()
{
	var alpha = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
	var offset=0;
	while(offset<6)
	{
		var a = alpha[Math.floor(Math.random() * alpha.length)];
        var b = alpha[Math.floor(Math.random() * alpha.length)];
        var c = alpha[Math.floor(Math.random() * alpha.length)];
        var d = alpha[Math.floor(Math.random() * alpha.length)];
        var e = alpha[Math.floor(Math.random() * alpha.length)];
        var f = alpha[Math.floor(Math.random() * alpha.length)];
        var g = alpha[Math.floor(Math.random() * alpha.length)];
		
		offset++;	   
	}
	var code=a + b + c  + d  + e + f + g;
	document.getElementById("captcha").value=code;
	document.getElementById("captcha").innerHTML=code;
	document.getElementById("captcha").style.textAlign="center";
	document.getElementById("captcha").style.paddingTop="10px";
}

function ValidCaptcha()
{
	var pwd1=document.getElementById("captchaCode").value;
	var pwd2=document.getElementById("captcha").value;
	
	var tempStr1=[...pwd1];
	var tempStr2=[...pwd2];

	
	console.log(tempStr1);
	console.log(tempStr2);
	var offset=0, flag=0;
	while(offset<tempStr1.length && offset<tempStr2.length)
	{
		if(tempStr1[offset]!=tempStr2[offset]) 
		{
				flag=1;
				break;
		}
		offset++;
	}
	
	if(flag==1)
	{
		alert("Captcha Should Be Same !");
	}

	
	
}
	
