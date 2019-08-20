function sendMessage()
{
	
	var message = document.typer.inputField.value;
	alert(message);
	var loader = document.getElementById("messages").innerHTML;
	alert(loader);
	var	loaded =loader + '<div class="message-row"><div class="transfer-message-block-s"><p class="transfer-message-s">'+ message + '<span class="text-time-s"><br>10:26 P.M.</span></p></div></div><!--message-row--> <div class="message-row"><p class="transfer-message-s" style="padding: 0px;box-shadow: none;"></p></div><!--message-row-->';
	alert(loaded);
	document.getElementById("messages").innerHTML = ""+loaded;		

}
function positionSizer()
{
	var x = document.getElementById("messages");
	var sizeH = window.innerHeight;
	sizeH =sizeH -75-15;
	x.style.minHeight = "sizeH";
	
}

//setTimeout(function(){
//	window.location.reload();},15000);