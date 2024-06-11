<tr name="%value section%_subMenu" style="display: %value display%">
  <td id="i%value encode(htmlattr) url%"
    %ifvar url equals('nonedsp')%
      class="menuitem-unclickable"
    %else%
      class="menuitem %value className%"
      onmouseover="menuMouseOver(this, '%value url encode(javascript)%');"
      onmouseout="menuMouseOut(this, '%value url encode(javascript)%');"
      onclick="menuSelect(this, '%value url encode(javascript)%');"
    %endif% style="display: block;">
    <span style="display: inline-block; width:100%; height: 100%;">
      %ifvar url equals('dummy-horizontal-linedsp')%
        <hr/>
      %else%
        %ifvar url equals('nonedsp')%
          %value none text%
        %else%
          %scope%
          %rename text inString -copy%
          %invoke wm.server.csrfguard:replaceSpecialCharacters%
            <script>
              var label = "%value label%";
              if (!label) {
                label = "%value text%";
              }
              label = label.replace(/NBSP/g, ' ');
              if (is_csrf_guard_enabled && needToInsertToken) {
                createFormWithTargetAndSetProperties("htmlform_menu_subelement_%value replacedString%", "%value encode(javascript) url%", "POST", "BODY", "%ifvar target%%value $host%%value target%%else%body%endif%");
                setFormProperty("htmlform_menu_subelement_%value replacedString%", _csrfTokenNm_, _csrfTokenVal_);
                document.write('<a id="a%value encode(htmlattr) url%" href="javascript:htmlform_menu_subelement_%value replacedString%.submit()"  style="display: block; padding-left: 2em; padding-top: 0.5em; padding-bottom: 0.4em;"> ' + label + ' %ifvar target% ... %endif% </a>');
              } else {
                document.write('<a id="a%value encode(htmlattr) url%" target="%ifvar target%%value $host%%value target%%else%body%endif%" href="%value encode(javascript) url%" style="display: block; padding-left: 2em; padding-top: 0.5em; padding-bottom: 0.4em;"> ' + label + ' %ifvar target% ... %endif% </a>');
              }
            </script>
          %endinvoke%
          %endscope%
        %endif%
      %endif%
    </span>
  </td>
</tr>
