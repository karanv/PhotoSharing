	function Tagger(parentId, childId, userMenuId, form, photoId, user, xCoord, yCoord, height, width) {
		console.log("i am in javascript");
		console.log("The variable is ", parentId);

		// The parent DIV which contains the image
		
		this.parent = document.getElementById("parent"+ parentId);
		this.parent.style.position = "relative";
		this.parent.style.cursor = "crosshair";
		this.parent.zIndex = 0;
			
		// The child div which represents the resizable tagging box

  		this.element = document.getElementById("child"+ childId);
  		this.element.style.position = "absolute";
    	this.element.style.zIndex = 100;
		this.element.style.borderStyle = "solid";
		this.element.style.borderColor = "white";
		this.element.style.background = "black";
		this.element.style.opacity = "0.4";
		
		// The user Menu which shows the users you can tag
		this.usermenu = document.getElementById("menu" + userMenuId);
		this.usermenu.style.zIndex = 102;
		this.usermenu.style.opacity = "0.6";
		this.usermenu.style.position = "absolute";
		this.usermenu.style.cursor = "pointer";
				
		// The Properties of the Tag. 
		this.tagX = document.getElementById(xCoord);
		this.tagY = document.getElementById(yCoord);
		this.tagHeight = document.getElementById(height);
		this.tagWidth = document.getElementById(width);
		this.tagUser = document.getElementById(user);
		this.tagPhotoId = document.getElementById(photoId);
		this.tagPhotoId.value = parentId;
		
		this.parent.ondragstart = function() {return false;};
		var button = document.getElementById("button"+parentId);	
		var cancel = document.getElementById("cancel"+parentId);
		
		button.innerHTML="Done Tagging";	
		cancel.style.display  = "";
		this.parent.onmousedown = this.wrap(this, "mousedown");
		
		this.Xcoord = 0;this.Ycoord = 0;this.XcurrentCoord = 0;this.YcurrentCoord = 0;
		this.bottomOffset = 12;this.rightOffset = 8;this.offsetWidth = this.parent.offsetWidth; 
		this.offsetHeight = this.parent.offsetHeight; this.selectMenu = false;
		this.dynamicWidth;this.dynamicHeight;
		this.originX; this.originY;
	
		if (button.addEventListener) 
			button.addEventListener("click", donetagging, false);
			
		if (cancel.addEventListener) 
			cancel.addEventListener("click", canceltagging, false);

			// This is the event handler function registered above
			function donetagging(event) { 
				var myform = document.getElementById(form);
				this.tagHeight = document.getElementById(height);
				this.tagUser = document.getElementById(user);
				this.tagWidth = document.getElementById(width);
				
				console.log("this.tagHeight",this.tagHeight.value);
				console.log("this.tagUser",this.tagUser.value);
				console.log("this.tagWidth",this.tagWidth.value);
				
				if((this.tagHeight.value == "0") || (this.tagWidth.value == "0") || (this.tagUser.value == "0")){
					event.target.onclick=function(){return false;}
					window.alert("Please draw the tag properly and select a user from the drop down");
				}
				else if((this.tagHeight.value == "") || (this.tagWidth.value == "") || (this.tagUser.value == "")){
					event.target.onclick=function(){return false;}
					window.alert("Please draw the tag properly and select a user from the drop down");
					
				}
				else
					myform.submit();
			}	
			
			function canceltagging(event) { 
				event.target.onclick = window.location.reload();
			}	
	}
  
	Tagger.prototype.wrap = function(obj, method) {
    	return function(event) {
        	obj[method](event);
    		}
    	}

	Tagger.prototype.mousedown = function(event) {	
		
		if(!this.selectMenu){
	
		console.log("pageX",event.pageX);
		console.log("pageY",event.pageY);
		console.log("clientX",event.clientX);
		console.log("clientY",event.clientY);
		console.log("this is a mousedown");	
		console.log("parent offsettop",this.parent.offsetTop);
	
		this.Xcoord = event.pageX - this.parent.offsetLeft;
		this.Ycoord = event.pageY - this.parent.offsetTop;	
	
		this.element.style.height = "0px";
		this.element.style.width = "0px";
		this.element.style.left = this.Xcoord + "px";
		this.element.style.top = this.Ycoord + "px";
		
		this.tagX.value = 0;
		this.tagY.value = 0;
		this.tagHeight.value = 0;
		this.tagWidth.value = 0;
		this.tagUser.value = 0;
		this.usermenu.style.display = "";
		// this.usermenu.style.left = this.Xcoord + 10 + "px" ;
		// this.usermenu.style.top = this.Ycoord + 10 + "px";
	
		console.log("left",this.element.style.left);
		console.log("top",this.element.style.top);
		}
	
		this.oldMoveHandler = document.body.onmousemove;	
		document.onmousemove = this.wrap(this, "mousemove");
		this.oldUpHandler = document.body.onmouseup;
		document.onmouseup = this.wrap(this,"mouseup");
		this.isMouseDown = true;	
	}

	Tagger.prototype.mousemove = function(event){
		console.log("this is mousemove");	
		
	
	// Checking whther the tag is in bounds. 
		if(event.pageX > this.offsetWidth)
 			this.Xcurrentcoord = this.offsetWidth -this.rightOffset;
		else if (event.pageX < this.parent.offsetLeft)
			this.Xcurrentcoord = 0;
		else
			this.Xcurrentcoord = event.pageX - this.parent.offsetLeft;
	
		if(event.pageY < this.parent.offsetTop)	
			this.Ycurrentcoord = 0;		
		else if(event.pageY > (this.parent.offsetTop) + (this.offsetHeight -this.bottomOffset))
			this.Ycurrentcoord = this.offsetHeight - this.bottomOffset;
		else
			this.Ycurrentcoord = event.pageY - this.parent.offsetTop;	
	
	// Resizing the box dynamically 			
		this.dynamicWidth = 	Math.abs(this.Xcoord - this.Xcurrentcoord);	
		this.dynamicHeight = Math.abs(this.Ycoord - this.Ycurrentcoord) ;
		this.originX = (this.Xcoord - this.Xcurrentcoord<0?this.Xcoord:this.Xcurrentcoord);
		this.originY = (this.Ycoord - this.Ycurrentcoord<0?this.Ycoord:this.Ycurrentcoord);	
		
		this.element.style.width = this.dynamicWidth + "px";
		this.element.style.height = this.dynamicHeight + "px";
		this.element.style.left =  this.originX + "px";
		this.element.style.top = this.originY + "px";		
		this.usermenu.style.left = this.dynamicWidth + this.originX + "px" ;
		this.usermenu.style.top =  this.dynamicHeight + this.originY + "px";
	}

	Tagger.prototype.mouseup = function(event){
    	console.log("this is mouseup")	
		this.isMouseDown = false;
		this.selectMenu = false;
		this.usermenu.onmousedown = this.wrap(this, "mousedownMenu");
		document.onmousemove = this.oldMoveHandler;
		document.onmouseup = this.oldUpHandler;	
		this.tagX.value = this.originX;
		this.tagY.value = this.originY;
		this.tagWidth.value = this.dynamicWidth;
		this.tagHeight.value = this.dynamicHeight;
		this.tagUser.value = this.usermenu.value;
		console.log("user menu value", this.usermenu.value);
		console.log("this.tagX.value",this.tagX.value);
		console.log("this.tagY.value",this.tagY.value);
		console.log("this.tagWidth.value",this.tagWidth.value);
		console.log("this.tagHeight.value",this.tagHeight.value);
		console.log("this.tagUser.value",this.tagUser.value);
	}
	
	Tagger.prototype.mousedownMenu = function(event){
    	console.log("this is mousedown on Menu");		
		this.selectMenu = true;
	}	