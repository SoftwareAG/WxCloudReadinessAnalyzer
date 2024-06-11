<html>
<head>
<link rel="stylesheet" type="text/css" href="webMethods.css"/>
 <link rel="stylesheet" TYPE="text/css" HREF="webMethods-wM-AdminUI-DELITE.css"/>
%ifvar webMethods-wM-AdminUI%
  <link rel="stylesheet" TYPE="text/css" HREF="webMethods-wM-AdminUI-DELITE.css"/>
  <script>webMethods_wM_AdminUI = 'true';</script>
%endif%
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<meta http-equiv="Expires" content="-1">
<script src="common-menu.js"></script>
<script src="csrf-guard.js"></script>
<script type="text/javascript">
var selected = null;
var menuInit = false;

function menuSelect(object, id) {
  selected = menuext.select(object, id, selected);
}

function menuMouseOver(object, id) {
  menuext.mouseOver(object, id, selected);
}

function menuMouseOut(object, id) {
  menuext.mouseOut(object, id, selected);
}

function initMenu(firstImage) {
    menuInit = true;
    return true;
}

function getElements(tag, name) {
	var elem = document.getElementsByTagName(tag);
	var arr = new Array();
	for(i=0, idx=0; i<elem.length; i++) {
		att = elem[i].getAttribute("name");
		if(att == name) {
			arr[idx++] = elem[i];
		}
	}
	return arr;
}
//Action on TAB key
function checkTabPress(e) {
    'use strict';
    var ele = document.activeElement;
	if (e.shiftKey) {
		return;
	}
    if (e.keyCode === 9 && ele.nodeName.toLowerCase() === 'a') {
		//var pNode = ele.parentNode.parentNode.parentNode.previousElementSibling;
		var pNode = ele.parentNode.parentNode;
		//alert(pNode);
		if (pNode.getAttribute('manualhide') == 'true') {
			var id = pNode.getAttribute('id').concat('_subMenu');
			//alert(id);
			var imgId = pNode.getAttribute('id').concat('_twistie');
			//alert(imgId);
			toggle(pNode, id, imgId);
			var nextEl = findNextTabStop(ele);
			nextEl.focus();
		}
		if (pNode.getAttribute('manualhide') == 'false') {
			var nextEl = findNextTabStop(ele);
			nextEl.focus();
		}
    }
}

//Action on SHIFT-TAB key
function checkShiftTabPress(e) {
    'use strict';
    var ele = document.activeElement;
    if (e.shiftKey && e.keyCode === 9 && ele.nodeName.toLowerCase() === 'a') {
		var pNode = ele.parentNode.parentNode;
		//alert(pNode.getAttribute('id').concat('_subMenu'));
		
		if (pNode.getAttribute('manualhide') == 'true' || pNode.getAttribute('manualhide') == 'false') {
			var id = pNode.getAttribute('id').concat('_subMenu');
			//alert(id);
			var imgId = pNode.getAttribute('id').concat('_twistie');
			//alert(imgId);
			toggle(pNode, id, imgId);
			var prevEl = findPreviousTabStop(ele);
			prevEl.focus();
		}
    }
}
//Add an event listener for Tab key
document.addEventListener('keyup', function (e) {
    checkTabPress(e);
}, false);

//Add an event listener for Shift Tab key
document.addEventListener('keyup', function (e) {
    checkShiftTabPress(e);
}, false);

//Find the next TAB stop
function findNextTabStop(el) {
    var universe = document.querySelectorAll('a[href]');
    var list = Array.prototype.filter.call(universe, function(item) {return item.tabIndex >= "0"});
    var index = list.indexOf(el);
    return list[index + 1] || list[0];
  }

//Find the previous TAB stop  
function findPreviousTabStop(el) {
    var universe = document.querySelectorAll('a[href]');
    var list = Array.prototype.filter.call(universe, function(item) {return item.tabIndex >= "0"});
    var index = list.indexOf(el);
    return list[index - 1] || list[0];
  }
</script>
</head>

%invoke WxCloudReadinessAnalyzer.ui:mainMenu%
<body class="menu">
<table class="menuTable" width="100%" cellspacing="2" cellpadding="2" border="2" id="mTable">

%scope buttonUrls%
%loop sections%
    %ifvar name equals('hide')%
    %else%
        %scope param(truestr='true') param(falsestr='false') param(expanded='false')%
            %rename ../name name -copy%
            %rename ../text text -copy%
            %include menu-section.dsp%
        %endscope%
    %endif%

    %loop submenu%
        %ifvar url -notempty%
            %scope param(tablerow='table-row') param(display='block') param(class='menuitem-selected') param(className='xyz')%
                %rename ../../text section -copy%
                %rename ../text text -copy%
                %rename ../url url -copy%
                %rename ../target target -copy%

                %include menu-subelement.dsp%
            %endscope%
        %endif%
    %endloop%
%endloop%
%endscope%
</table>
        
    <div style="height=0; width=0">
        <form name="urlsaver">
            %ifvar webMethods-wM-AdminUI% <input type="hidden" name="webMethods-wM-AdminUI" value="true"> %endif%
            <input type="hidden" name="helpURL" value="doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_SrvrStatsScrn">
        </form>
    </div>
<script>menuSelect('', 'stats-general.dsp')</script>
<script>
document.getElementsByClassName("menusection-Server")[0].style.color="#ffffff";
</script>
</body>
</html>
