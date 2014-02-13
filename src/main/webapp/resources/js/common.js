function getNowString(){
	var temp=new Date();
	var day=temp.getDate();
	if(day < 10) {
		day = "0" + day;
	}

	var month=parseInt(temp.getMonth())+1;
	if(month < 10) {
		month = "0" + month;
	}
	var year=temp.getFullYear();
	//alert(year.toString().substr(2));
	year=year.toString().substr(2);

	var hour=temp.getHours();
	if(hour<10){
		hour="0"+hour;
	}

	var minutes=temp.getMinutes();
	if(minutes<10){
		minutes="0"+minutes;
	}

	var seconds=temp.getSeconds();
	if(seconds<10){
		seconds="0"+seconds;
	}
	
	var today=year +""+ month +""+day+""+hour+""+minutes+""+seconds;
	return today;
}