//设置COOKIE
function setCookie(name,value){
	var argv = arguments;
	var argc = arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	var path = (argc > 3) ? argv[3] : '/'; 
	var domain = (argc > 4) ? argv[4] : null;
	var secure = (argc > 5) ? argv[5] : false;
	document.cookie = name + "=" + escape (value) +
	((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
	((path == null) ? "" : ("; path=" + path)) +
	((domain == null) ? "" : ("; domain=" + domain)) +
	((secure == true) ? "; secure" : ""); 
}
//读取COOKIE
function getCookie(name){
	var arg = name + "=";   
    var alen = arg.length;   
    var clen = document.cookie.length;   
    var i = 0;   
    var j = 0;   
    while(i < clen){   
        j = i + alen;   
        if (document.cookie.substring(i, j) == arg)   
            return getCookieVal(j);   
        i = document.cookie.indexOf(" ", i) + 1;   
        if(i == 0)   
            break;   
    }   
    return null;
}
//清除COOKIE
function clearCookie(name){
	if(getCookie(name)){
    	var expdate = new Date(); 
    	expdate.setTime(expdate.getTime() - (86400 * 1000 * 1)); 
    	setCookie(name, "", expdate); 
  	}
}
function getCookieVal(offset){
	var endstr = document.cookie.indexOf(";", offset);
	if(endstr == -1){
		endstr = document.cookie.length;
	}
	return unescape(document.cookie.substring(offset, endstr));
}