function showTime()
{
	var obj=document.getElementById("shownowTime");
	var now=new Date();
	obj.innerHTML=(now.getFullYear())+"年"+
	(now.getMonth()+1)+"月"+
	(now.getDate())+"日"+
	(now.getHours())+"时"+
	(now.getMinutes())+"分"+
	(now.getSeconds())+"秒";
	
	
}