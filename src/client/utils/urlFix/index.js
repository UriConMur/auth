var urlParams = new URLSearchParams(window.location.search);
var url       = urlParams.get('p');
window.history.pushState("", "Title", url);
