function captchaCall(){
     var alphabetData = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	 	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
 	    	'0','1','2','3','4','5','6','7','8','9');
     var i;
     for (i=0;i<6;i++){
         var a = alphabetData[Math.floor(Math.random() * alphabetData.length)];
         var b = alphabetData[Math.floor(Math.random() * alphabetData.length)];
         var c = alphabetData[Math.floor(Math.random() * alphabetData.length)];
         var d = alphabetData[Math.floor(Math.random() * alphabetData.length)];
         var e = alphabetData[Math.floor(Math.random() * alphabetData.length)];
         var f = alphabetData[Math.floor(Math.random() * alphabetData.length)];
         var g = alphabetData[Math.floor(Math.random() * alphabetData.length)];
                      }
         var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
         document.getElementById("mainCaptchaData").innerHTML = code;
		 document.getElementById("mainCaptchaData").value = code;
       }
function validCaptchaData(){

	let inputData=document.getElementById('mainCaptchaData').value;
     var string1 = removeSpaces(inputData);
     var string2 = removeSpaces(document.getElementById('cpatchaTextBox').value);
     if (string1 == string2){
    	// alert();
            return true;
     }else{
    	// captchaCall();
          return false;
		  
          }
}
function removeSpaces(string){
     return string.split(' ').join('');
}