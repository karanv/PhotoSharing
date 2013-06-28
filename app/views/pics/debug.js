 // Display a message in a special debugging output section of the document.
// If the document does not contain such a section, create one.
function debug(msg) {
// Find the debugging section of the document, looking at HTML id attributes
var log = document.getElementById("debuglog");
// If no element with the id "debuglog" exists, create one.
if (!log) {
log = document.createElement("div"); // Create a new <div> element
log.id = "debuglog"; // Set the HTML id attribute on it
log.innerHTML = "<h1>Debug Log</h1>"; // Define initial content
document.body.appendChild(log); // Add it at end of document
}
// Now wrap the message in its own <pre> and append it to the log
var pre = document.createElement("pre"); // Create a <pre> tag
var text = document.createTextNode(msg); // Wrap msg in a text node
pre.appendChild(text); // Add text to the <pre>
log.appendChild(pre); // Add <pre> to the log
}