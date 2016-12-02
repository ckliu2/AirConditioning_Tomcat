<%@ include file="/common/taglibs.jsp"%>

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="sensorstatus.list"/></td>
      </tr>
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="1" />
<display:table name="sensorstatusList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
     
     <display:column titleKey="common.id" style="text-align:left" sortable="true">     
        <c:out value="${count}"/>
     </display:column> 
   
    <display:column property="sensor.controller.room.building.name" sortable="true" titleKey="building.name" style="text-align:left"/>
   
    <display:column property="sensor.controller.room.name" sortable="true" titleKey="room.name" style="text-align:left"/>
   
    <display:column property="sensor.controller.name" sortable="true" titleKey="controller.name" style="text-align:left"/>
    
    <display:column property="sensor.name" sortable="true" titleKey="sensor.name" style="text-align:left"/>
    
    <display:column property="status" sortable="true" titleKey="sensorstatus.status" decorator="com.base.web.displaytag.YesNoDecorator"/>
    <display:column property="createdDate" sortable="true" titleKey="common.createdDate" style="text-align:left"/>
    
    
    
    <c:set var="count" value="${count+1}" />
</display:table>
        </td>
    </tr>
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>
</table>
<form name="form1" action="saveSensorstatus.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="sensorstatus.id" value="">
    <select name="selectedSensorstatusIds" multiple="true" style="display:none"></select>
</form>
