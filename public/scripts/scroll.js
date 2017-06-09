$(init)

function init () {
	var messageList = $("#message-list");
	messageList.scrollTop(messageList[0].scrollHeight);
	console.log(messageList)
}