<%@ include file="/common/taglibs.jsp"%>




<SCRIPT LANGUAGE="VBScript">
<!--
Sub window_onLoad()

<ww:iterator value="sensorList">
   frm1.ChtIEx<ww:property value="id"/>.IpAddr = "<ww:property value="mydvr.ip"/>"
   frm1.ChtIEx<ww:property value="id"/>.UserName = "<ww:property value="mydvr.userId"/>"
   frm1.ChtIEx<ww:property value="id"/>.Password = "<ww:property value="mydvr.password"/>"
   frm1.ChtIEx<ww:property value="id"/>.PortNum = <ww:property value="mydvr.port"/>
   frm1.ChtIEx<ww:property value="id"/>.ChNum = <ww:property value="channel"/>
   frm1.ChtIEx<ww:property value="id"/>.Connect()
</ww:iterator>

end sub
-->
</SCRIPT>




<form id="frm1">

<!--
<img src="images/folderopen.gif" onclick='checkedAll();'> <fmt:message key="common.openAll"/>
&nbsp;&nbsp;&nbsp;
<img src="images/folder.gif" onclick='checkedAll();'> <fmt:message key="common.closeAll"/>
-->


<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="sensor.list"/></td>
      </tr>
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="1" />
<display:table name="sensorList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
     <display:column titleKey="common.id" style="text-align:left" sortable="true">     
        <c:out value="${count}"/>
     </display:column> 
    
    <display:column property="controller.room.building.name" sortable="true" titleKey="building.name" style="text-align:left"/>
    
    <display:column property="controller.room.name" sortable="true" titleKey="room.name" style="text-align:left"/>
    
    <display:column property="controller.name" sortable="true" titleKey="controller.name" style="text-align:left"/>
    
    <display:column property="name" sortable="true" titleKey="sensor.name" style="text-align:left" />

     <display:column titleKey="common.dvrviewer" style="text-align:center" sortable="true">     
        <input type="checkbox" name="chk<c:out value="${count}"/>"  checked="true" onclick="if (this.checked == true) document.ChtIEx<c:out value="${row.id}"/>.style.display='inline'; else document.ChtIEx<c:out value="${row.id}"/>.style.display='none';" >
     </display:column> 
  
    

    <display:column property="mydvr.name" sortable="true" titleKey="myDVR.name" style="text-align:left" />
    
    <display:column property="channel" sortable="true" titleKey="myDVR.channel" style="text-align:center" />
    
    
    
    <display:column  style="text-align:left" sortable="true"  titleKey="myDVR.livingImg">
           
           <script>
             // alert("ChtIEx<c:out value="${row.id}"/>");
             //document.ChtIEx<c:out value="${row.id}"/>.style.display='inline';
           </script>
           
           <OBJECT ID="ChtIEx<c:out value="${row.id}"/>" WIDTH=320 HEIGHT=240 VSPACE=3 HSPACE=3
              CLASSID="CLSID:D67DB088-70B4-4006-B052-57F614FD3AA8"
              CODEBASE="http://www.vguard.net/myasp/chtIEx.cab#Version=1,0,0,12">
              <PARAM NAME="_Version" VALUE="65536">
              <PARAM NAME="_ExtentX" VALUE="12933">
              <PARAM NAME="_ExtentY" VALUE="8567">
              <PARAM NAME="_StockProps" VALUE="0">
            </OBJECT>    
    </display:column>
    
    
    <c:set var="count" value="${count+1}" />
</display:table>
        </td>
    </tr>
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>
</table>

</form>


<script type="text/javascript">
checked=false;
function checkedAll (frm1) {
	var aa= document.getElementById('frm1');
	 if (checked == false)
          {
           checked = true
          }
        else
          {
          checked = false
          }
	for (var i =0; i < aa.elements.length; i++) 
	{
	 aa.elements[i].checked = checked;
	}
}
</script>




<form name="form1" action="saveSensor.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="sensor.id" value="">
    <select name="selectedSensorIds" multiple="true" style="display:none"></select>
</form>


