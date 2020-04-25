// Implementation of collapsible sections (accordion). Scheme of action: <div class="collapsible">Collapsible Title</div><div class="content">Content</div>
// !!! Uses DOM
function change_visibility(content,noAnimation) {
	if (content.style.visibility === "visible") {
	  content.style.transition = "opacity 0.625s, visibility 0.625s, max-height 0.625s";
	  content.style.visibility = "hidden";
	  content.style.opacity = "0";
	  content.style.maxHeight = "0";
	} else {
	  noAnimation? content.style.transition= "none" : content.style.transition = "opacity 1s, visibility 1.25s, max-height 1.25s";
	  content.style.visibility = "visible";
	  content.style.opacity = "1";
	  content.style.maxHeight = "200px";
	}
}

function activate_collapsible() {
	var collapsible = document.getElementsByClassName("collapsible");

	for (let i = 0; i < collapsible.length; i++) {
	  var content = collapsible[i].nextSibling;
	  if (collapsible[i].classList.contains("active"))
	  {
		  change_visibility(content,true);
	  }
	  collapsible[i].addEventListener("click", function() {
		content = this.nextSibling;
		this.classList.toggle("active");
		change_visibility(content);
	  });
	}
}