$(scrollToBottom)

function scrollToBottom () {
	var messageList = $("#message-list");
	messageList.scrollTop(messageList[0].scrollHeight);
}