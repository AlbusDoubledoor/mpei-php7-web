function validateFeedback() {
	if (from.value.length == 0) {
		alert('Заполните поле [От кого]');
		return false;
	}
	if (subject.value.length == 0) {
		alert('Заполните поле [Тема]');
		return false;
	}
	if (message.value.length == 0) {
		alert('Заполните сообщение');
		return false;
	}
	return true;
}

// Implementation of collapsible sections (accordion). Scheme of action: <div class="collapsible">Collapsible Title</div><div class="content">Content</div>
// !!! Uses DOM
function change_visibility(content) {
	if (content.style.visibility === "visible") {
	  content.style.transition = "opacity 0.625s, visibility 0.625s, max-height 0.625s";
	  content.style.visibility = "hidden";
	  content.style.opacity = "0";
	  content.style.maxHeight = "0";
	} else {
	  content.style.transition = "opacity 1s, visibility 1.25s, max-height 1.25s";
	  content.style.visibility = "visible";
	  content.style.opacity = "1";
	  content.style.maxHeight = "350px";
	}
}

function activate_collapsible() {
	var collapsible = document.getElementsByClassName("collapsible");

	for (let i = 0; i < collapsible.length; i++) {
	  var content = collapsible[i].nextSibling;
	  if (collapsible[i].classList.contains("active"))
	  {
		  change_visibility(content);
	  }
	  collapsible[i].addEventListener("click", function() {
		content = this.nextSibling;
		this.classList.toggle("active");
		change_visibility(content);
	  });
	}
}

// Interactive buttons script, such as button "to top"
// Uses "wrapper-pattern" with functions to be compatible with old ES (IE 11)
 function InteractiveButton(name) {
		let myButton = document.createElement("button");
		
		myButton.innerHTML = name;
		
		myButton.visibility = function (conditionList) {
			let vis_cond = true;
			if (!Array.isArray(conditionList))
				conditionList = [conditionList];
			for(let i = 0; i < conditionList.length; ++i)
			{
				vis_cond &= conditionList[i];
			}
			if (vis_cond) myButton.style.visibility="visible";
			else myButton.style.visibility="hidden";
			
			return vis_cond;
		}
		
		myButton.events = function(eventList,functions) {
			if (!Array.isArray(eventList))
				eventList = [eventList];
			if (!Array.isArray(functions))
				functions = [functions];
			for(let i = 0; i < eventList.length; ++i)
			{
				myButton.addEventListener(eventList[i], functions[i]);
			}
		}
		
		myButton.setSide = function(side,value){
			if (!Array.isArray(side)) 
				side = [side];
			if (!Array.isArray(value))
				value = [value];
			for(let i=0; i < side.length; ++i) 
			{
				if (side[i] == "top") myButton.style.top = value[i];
				if (side[i] == "left") myButton.style.left = value[i];
				if (side[i] == "right") myButton.style.right = value[i];
				if (side[i] == "bottom") myButton.style.bottom = value[i];
			}
		}
		
		myButton.position = function(type,side,value){
			myButton.style.position = type;
			myButton.setSide(side,value);
		}
		
		myButton.setClass = function(className) {
				this.classList.toggle(className,true);
		}
		
		return myButton;
}

function trackScroll(whatElement) {
		whatElement.visibility(window.pageYOffset > 0);
	}
	
function ToTopButton(name) {
		let myButton = new InteractiveButton(name);
		myButton.offset = -30;
		myButton.interval = 1;
	
		myButton.toTop = function() {
			let buttonContext = this;
			if (window.pageYOffset > 0) 
			{
				window.scrollBy(0,buttonContext.offset); 
				setTimeout(function() { buttonContext.toTop() },buttonContext.interval);
			}
		}

		myButton.changeOffset = function(offset) {
			this.offset = offset;
		}
		
		myButton.changeInterval = function(interval) {
			this.interval = interval;
		}
		
		
		myButton.events("click",myButton.toTop);
		myButton.visibility(window.pageYOffset > 0);
		window.addEventListener('scroll', function() { trackScroll(myButton);});
		
		return myButton;
}