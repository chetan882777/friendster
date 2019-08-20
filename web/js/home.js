function sideBarActive()
{
	document.getElementById("side_bar_l").style.width ="340px";
	document.getElementById("sidebarclosebtn").style.color ="gray";
}

function sideBarDeactive()
{
	document.getElementById("side_bar_l").style.width ="0px";
	document.getElementById("sidebarclosebtn").style.color ="#7c5ac2";
	
}
function sideBarDeactiveR()
{
	document.getElementById("side_bar_r").style.width ="0px";
	document.getElementById("sidebarclosebtnR").style.color ="#7c5ac2";
	
}
function sideBarActiveR()
{
	document.getElementById("side_bar_r").style.width ="340px";
	document.getElementById("sidebarclosebtnR").style.color ="gray";
}
function resizeIframe(obj){
	obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
}

function positionSizer()
{
	var x = document.getElementById("sizeLoader");
	var sizeH = window.innerHeight;
	
	sizeH =sizeH -75;
	var sizeW = screen.availHeight;
	var widthS = screen.availWidth;
	
	if(widthS< 450)
	{
		sizeH =screen.availHeight;
	}
	var css1 = ":root{ --main-fixed-height:"+sizeH+"px;}";
	x.innerHTML = css1;
}