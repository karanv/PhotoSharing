function showTags(parentId, tagId, userName, tagLeft, tagTop, tagWidth, tagHeight) {
	console.log("i am in showTags");

	console.log("parentId", parentId);
	console.log("tagId", tagId);
	console.log("tagLeft", parentId);
	console.log("tagTop", parentId);
	console.log("tagWidth", parentId);
	console.log("tagheight", parentId);
	
	// The parent DIV which contains the tags
	this.parent = document.getElementById("parent"+ parentId);
	this.parent.style.position = "relative";
	this.parent.style.cursor = "help";
	this.parent.zIndex = 0;
		
	// The tag div which is draw on mouseover
	this.tag = document.getElementById("tag"+ tagId);
	this.tag.style.position = "absolute";
	this.tag.style.zIndex = 100;
	this.tag.style.borderStyle = "solid";
	this.tag.style.borderColor = "white";
	this.tag.style.background = "black";
	this.tag.style.opacity = "0";
	this.tag.style.left = tagLeft +"px";
	this.tag.style.top = tagTop + "px";
	this.tag.style.height = tagWidth +"px";
	this.tag.style.width = tagHeight + "px";
		
	// The user shown inside the tag  
		this.username = document.getElementById("text" + tagId);
		this.username.innerHTML = userName;
}

function makeTagVisible(tagId){
	this.tag = document.getElementById("tag"+ tagId);
	this.username = document.getElementById("text" + tagId);
	this.tag.style.opacity = "0.4";
	this.username.style.opacity = "1";
	
}

function makeTagInVisible(tagId){
	this.tag = document.getElementById("tag"+ tagId);
	this.username = document.getElementById("text" + tagId);
	this.tag.style.opacity = "0";
	this.username.style.opacity = "0";
	
}