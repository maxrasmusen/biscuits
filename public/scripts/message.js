$(init)

function init() {
	$("#message-input-form").submit(function(event) {
		event.preventDefault()
		params = {user: this.elements[0].value, text: this.elements[1].value, biscuit_id: this.elements[2].value};
		addMessageToDOM(params);
		$.post("/messages", params, function() {
			
		});
		for (var i=0; i < this.elements.length-2; i++) {
			this.elements[i].value = "";
		}
	}) 
}

function addMessageToDOM(params) {
	$("#message-list").append(
		"<article class=\"message\"> <h4> "+ params["user"]+" </h4> " + 
		" <p> "+params["text"]+"</p> </article>"
	) 
	scrollToBottom()
}