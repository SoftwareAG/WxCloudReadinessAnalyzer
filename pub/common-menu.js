/*
 * Copyright © 1996 - 2017 Software AG, Darmstadt, Germany and/or Software AG USA Inc., Reston, VA, USA, and/or its subsidiaries and/or its affiliates and/or their licensors. 
 *
 * Use, reproduction, transfer, publication or disclosure is prohibited except as specifically provided for in your License Agreement with Software AG. 
*/

function toggle(parent, id, imgId) {
    var set = "none";
    var image = document.getElementById(imgId);
     if (parent.getAttribute("manualhide") == "true") {
        set = "table-row";
        parent.setAttribute("manualhide", "false");
        image.src = "../WmRoot/images/expanded.gif";
        var item = document.getElementById("elmt_" + id);
        item.style.backgroundColor = "#14629F";
        item.style.color = "#ffffff";
		if (item.getElementsByTagName("a").length > 0) {
			var aItem = item.getElementsByTagName("a")[0];
			aItem.style.color = "#ffffff";
		}
    }
    else {
        parent.setAttribute("manualhide", "true");
        image.src = "../WmRoot/images/collapsed_blue.png";
        var item = document.getElementById("elmt_" + id);
        item.style.backgroundColor = "#ffffff";
        item.style.color = "#14629F";
		if (item.getElementsByTagName("a").length > 0) {
			var aItem = item.getElementsByTagName("a")[0];
			aItem.style.color = "#14629F";
		}
    }
    var elements = getElements("tr", id);

    for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        element.style.cssText = "display:" + set;
    }
}

function getElements(tag, name) {
    var elem = document.getElementsByTagName(tag);
    var arr = new Array();
    for (i = 0, idx = 0; i < elem.length; i++) {
        att = elem[i].getAttribute("name");
        if (att == name) {
            arr[idx++] = elem[i];
        }
    }
    return arr;
}


function setMenuItem(rootid, bgcolor, color) {
    /* the td element */
    var tdobj = document.getElementById("i" + rootid);
    tdobj.style.backgroundColor = bgcolor;

    /* the a element within the td element above */
    var aobj = document.getElementById("a" + rootid);
    if (aobj != null && aobj.style != null) {
        aobj.style.color = color;
    }
}

(function(exports) {
  exports.select = function(object, id, selected) {
    if (selected != null) {
        setMenuItem(selected, "#ffffff", "#1776BF");
    }
    setMenuItem(id, "#1776BF", "#ffffff");
    return id;
  };

  exports.mouseOver = function(object, id, selected) {
    if (id != selected) {
        setMenuItem(id, "#CDE6F9", "#333333");
    }
    window.status = id;
  };

  exports.mouseOut = function(object, id, selected) {
    if (id != selected) {
        setMenuItem(id, "#ffffff", "#1776BF");
    }
    window.status = "";
  };
})(this.menuext = {});
