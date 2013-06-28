function AjaxSearch(search_text_box, url, param_key, target){
	this.element = document.getElementById(search_text_box);
	this.url = url;
	this.param_key = param_key;
	this.target = document.getElementById(target);
	this.substring = this.element.value;
	this.element.onkeyup = this.wrap(this, "onKeyUp");	
	this.requestURL = "";
	this.xmlhttp = null;
	if (window.XMLHttpRequest) {
		this.xmlhttp=new XMLHttpRequest();	
		this.xmlhttp.onreadystatechange=this.wrap(this, "onReadyStateChange");
	}
}


AjaxSearch.prototype.wrap = function(obj, method) {
    return function(event) {
        obj[method](event);
    }
}


AjaxSearch.prototype.onReadyStateChange = function() {
	if (this.xmlhttp.readyState==4 && this.xmlhttp.status==200)  {
		this.target.innerHTML=this.xmlhttp.responseText;
		this.element.style.background = "#333333";
	}
	
	//Change the color of the text box while the images are loading
	if (this.xmlhttp.readyState==1){
		this.element.style.background = "gray";
	}	
}


AjaxSearch.prototype.onKeyUp = function(event) {
	console.log("On key up");
    this.substring = encodeURIComponent(this.element.value);
	if (this.substring.length==0)  { 
		this.target.innerHTML="";
		return;
	}	
	this.requestURL= this.url+"?"+this.param_key+"="+this.substring;
	this.xmlhttp.open("GET",this.requestURL,true);
	this.xmlhttp.send();
}

