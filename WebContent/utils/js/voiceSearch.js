window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

var r = window.SpeechRecognition;
var rec = new r();

rec.onresult = function(e) {
    document.getElementById("search").value = (e.results[e.resultIndex][0].transcript);
    console.log((e.results[e.resultIndex][0].transcript));
}

rec.continuous = true;

function vSearch(button) {

	if(typeof rec === "undefined")
		alert("Voice Search is currently supported only on Chrome"); 
	
	rec.start();
    button.disabled = true;

    setTimeout(() => {
    	rec.stop();
        button.disabled = false;
        button.submit();
     }, 4000);
}