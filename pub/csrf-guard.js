/*
 * Copyright � 1996 - 2017 Software AG, Darmstadt, Germany and/or Software AG USA Inc., Reston, VA, USA, and/or its subsidiaries and/or its affiliates and/or their licensors. 
 *
 * Use, reproduction, transfer, publication or disclosure is prohibited except as specifically provided for in your License Agreement with Software AG. 
*/
var _csrfTokenNm_           =  _csrfTokenNm_;
var _csrfTokenVal_          =  _csrfTokenVal_;  
var is_csrf_guard_enabled   =  is_csrf_guard_enabled;
var needToInsertToken       =  needToInsertToken;
var webMethods_wM_AdminUI   =  webMethods_wM_AdminUI;

if(is_csrf_guard_enabled != true && is_csrf_guard_enabled != false) {
    is_csrf_guard_enabled = false;
}

if(needToInsertToken != true && needToInsertToken != false) {
    needToInsertToken = false;
}

function createForm(formname, action, method, parent_tag) {
	if (!is_csrf_guard_enabled && !needToInsertToken) {
		return;
	}
	var htmlform = document.createElement('form');
	htmlform.setAttribute("name", formname);
	htmlform.setAttribute("id", formname);
	htmlform.setAttribute("action", action);
	htmlform.setAttribute("method", method);
	
	document.getElementsByTagName(parent_tag)[0].appendChild(htmlform);
}

function setFormProperty(form, propertyName, propertyValue) {
	if (!is_csrf_guard_enabled && !needToInsertToken) {
		return;
	}
	var element = document.createElement("input");
                                                 
	element.setAttribute("type", "hidden");
    element.setAttribute("name", propertyName);
    element.setAttribute("value", propertyValue);
    
	var htmlform = document.forms[form];
    htmlform.appendChild(element);
	
}

function createFormWithTarget(formname, action, method, parent_tag, target) {
	if (!is_csrf_guard_enabled && !needToInsertToken) {
		return;
	}
	createForm(formname, action, method, parent_tag);
	var htmlform = document.forms[formname];
	htmlform.setAttribute("target", target);
}

function createFormWithTargetAndSetProperties(formname, action, method, parent_tag, target) {
	if (!is_csrf_guard_enabled && !needToInsertToken) {
		return;
	}
	
	action = decodeURIComponent(action);
	//alert(action);
	var url = action;
	//alert("ori url:"+url);
	var qIndex = url.indexOf('?');
	if(qIndex > 0) {
		url = action.substring(0, qIndex);
		//alert("form url part:"+url);
		
		if(target == null) {
			createForm(formname, url, method, parent_tag);
		} else {
			createFormWithTarget(formname, url, method, parent_tag, target);
		}
		var paramStr = action.substring(qIndex+1);
		//alert("params:"+paramStr);
		if (paramStr.indexOf('?') > 0) {
			//alert("param string has ? :"+paramStr);
			var eqIdx = paramStr.indexOf('=');
			var name = paramStr.substring(0, eqIdx);
			var value = paramStr.substring(eqIdx+1);			
			setFormProperty(formname, name, value);			
		}
		var params = null;
		if(paramStr.indexOf('&amp;') > 0) {
			params = paramStr.split('&amp;');
		} else {
			
			params = paramStr.split('&');
			//alert("params:  "+ params);
		}
		//alert("params:  "+ params);
		//alert("length :"+params.length);
		if(params.length > 0) {
			for(var i=0; i < params.length; i++) {
				var param = params[i].split('=');
				//alert("param :"+param);
				if(param.length == 2) {
					var paramName = param[0];
					var paramValue = param[1];
					
					if(paramName != null && paramValue != null) {
						
						setFormProperty(formname, paramName, paramValue);
					}
				}
			}
		}
	} else {
		if(target == null) {
			createForm(formname, url, method, parent_tag);
		} else {
			createFormWithTarget(formname, url, method, parent_tag, target);
		}
	}
}

function createFormAndSetProperties(formname, action, method, parent_tag) {
	if (!is_csrf_guard_enabled && !needToInsertToken) {
		return;
	}
	createFormWithTargetAndSetProperties(formname, action, method, parent_tag, null);
}

function getURL(normalURL, submitURL, linkname) {
	if(is_csrf_guard_enabled && needToInsertToken) {
		document.write('<a href=');
		document.write(submitURL);
		handleWmAdminUI(submitURL);
		document.write('>');
		document.write(linkname);
		document.write('</a>');		
    } else {
        document.write('<a href=');
		document.write(normalURL);
		handleWmAdminUI(normalURL);
		document.write('>');
		document.write(linkname);
		document.write('</a>');
    }
}

function handleWmAdminUI(sURL) {
	if (webMethods_wM_AdminUI) {
		addWmAdminUIQueryParam(sURL);
	}
	else {
		var params = parseQueryString();
		if (params["webMethods-wM-AdminUI"]) {
			addWmAdminUIQueryParam(sURL);
		}
	}
}

function addWmAdminUIQueryParam(sURL) {
	if(is_csrf_guard_enabled && needToInsertToken) {
		if (sURL && sURL.indexOf('.') > 0) {
		  var res = sURL.split(".");
		  if (res && res.length > 1) {
			  setFormProperty(res[1], 'webMethods-wM-AdminUI', 'true');
		  }
	  }
	}
	else {
		if (sURL.includes("?")) {
			document.write('&webMethods-wM-AdminUI=true');
		}
		else {
			document.write('?webMethods-wM-AdminUI=true');
		}
	}
}

function parseQueryString()  {

    var str = document.location.search;
    var objURL = {};

    str.replace(
        new RegExp( "([^?=&]+)(=([^&]*))?", "g" ),
        function( $0, $1, $2, $3 ){
            objURL[ $1 ] = $3;
        }
    );
    return objURL;
}