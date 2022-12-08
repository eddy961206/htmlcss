 var flag = 0; 
	function btn(){
		var btnColor = document.querySelector("#d01");
		if(flag==0){
			btnColor.style.backgroundColor= "red"; /* css에선 background-color. JS는 살짝 달라 */
			btnColor.style.borderRadius = "50%";
			document.querySelector
			flag=1;
		} else {
			btnColor.style.backgroundColor= "green";
			btnColor.style.borderRadius = "100%";
			flag=0;
		}
	}