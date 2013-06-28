
function Ajax(_id, _path) {
	var _ajax = new Object();
	_ajax._id = _id ? _id : null;
	_ajax._path = _path ? _path : null;
	_ajax._resultHandle = null;
	_ajax.createXmlRequest = function () {
		var _req = false;
		if (window.XMLHttpRequest) {
			_req = new XMLHttpRequest();
			if (_req.overrideMimeType) {
				_req.overrideMimeType("text/xml");
			}
		} else {
			if (window.ActiveXObject) {
				var versions = ["Microsoft.XMLHTTP", "MSXML.XMLHTTP", "Microsoft.XMLHTTP", "Msxml2.XMLHTTP.7.0", "Msxml2.XMLHTTP.6.0", "Msxml2.XMLHTTP.5.0", "Msxml2.XMLHTTP.4.0", "MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP"];
				for (var i = 0, icount = versions.length; i < icount; i++) {
					try {
						_req = new ActiveXObject(versions[i]);
						if (_req) {
							return _req;
						}
					}
					catch (e) {
					}
				}
			}
		}
		return _req;
	};
	_ajax._request = _ajax.createXmlRequest();
	_ajax.resultFuc = function () {
		if (_ajax._request.readyState == 4 && _ajax._request.status == 200) {
			_ajax._resultHandle(_ajax._request.responseText);
		}
	};
	_ajax.postSend = function (sendUrl, sendStr, resultHandle) {
		_ajax._resultHandle = resultHandle;
		_ajax._request.open("POST", sendUrl, true);
		_ajax._request.onreadystatechange = _ajax.resultFuc;
		_ajax._request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		_ajax._request.setRequestHeader("Content-length", sendStr.length);
		_ajax._request.setRequestHeader("Connection", "close");
		_ajax._request.send(sendStr);
	};
	_ajax.getSend = function (sendUrl, resultHandle) {
		_ajax._resultHandle = resultHandle;
		_ajax._request.open("GET", sendUrl, true);
		_ajax._request.onreadystatechange = _ajax.resultFuc;
		_ajax._request.send(null);
	};
	return _ajax;
}
function Xml(xmlStr) {
	var _xml = new Object();
	_xml._xmlStr = xmlStr;
	_xml._type;
	_xml.getXmlDoc = function () {
		var xmlDoc;
		if (window.ActiveXObject) {
			_xml._type = "IE";
			xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.loadXML(_xml._xmlStr);
		} else {
			if (document.implementation && document.implementation.createDocument) {
				_xml._type = "HH";
				xmlDoc = new DOMParser().parseFromString(_xml._xmlStr, "text/xml");
			} else {
				return null;
			}
		}
		return xmlDoc;
	};
	_xml._xmlDoc = _xml.getXmlDoc();
	_xml.getElements = function (name) {
		var items = _xml._xmlDoc.getElementsByTagName(name);
		return items;
	};
	return _xml;
}
function floor_show() {
	var iWidth = document.documentElement.clientWidth;
	var iHeight = document.documentElement.clientHeight;
	var bgObj = document.createElement("div");
	bgObj.setAttribute("id", "f_bgbox");
	bgObj.style.width = iWidth + "px";
	bgObj.style.height = Math.max(document.body.clientHeight, iHeight) + "px";
	document.body.appendChild(bgObj);
	var oShow = document.getElementById("f_show");
	oShow.style.display = "block";
	oShow.style.left = (iWidth - 302) / 2 + "px";
	oShow.style.top = (iHeight - 202) / 2 + "px";
}
function floor_close() {
	var oShow = document.getElementById("f_show");
	var bgObj = document.getElementById("f_bgbox");
	if (oShow) {
		oShow.style.display = "none";
	}
	if (bgObj) {
		document.body.removeChild(bgObj);
	}
}

