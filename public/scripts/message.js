$(init)

function init() {
	var biscuit_id = parseInt($("#hidden-biscuit-id").html())
	// console.log (biscuit_id)
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
	requestData(biscuit_id);
}

function addMessageToDOM(params) {
	$("#message-list").append(
		"<article class=\"message\"> <h4> "+ params["user"]+" </h4> " + 
		" <p> "+params["text"]+"</p> </article>"
	) 
	scrollToBottom()
}

function requestData(biscuit_id) {
	if (biscuit_id > 0) {
		$.get("/biscuits/"+biscuit_id+"/messages", function(data) {
			messages = JSON.parse(data);
			numCurrentMessages = $("#message-list").children().length
			for (var i = numCurrentMessages; i < messages.length; i++) {
				params = {user: messages[i].user, text: messages[i].text, biscuit_id: biscuit_id}
				addMessageToDOM(params)
			}
			setTimeout(requestData, 2000, biscuit_id)
		})
	}
}