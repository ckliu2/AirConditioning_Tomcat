<%@ include file="/common/taglibs.jsp"%>

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key='member.cardId'/>:<ww:property value="member.cardId"/>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key='member.name'/>:<ww:property value="member.name"/> <br><fmt:message key="machine.list"/></td>
      </tr>
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="1" />
<display:table name="machineListByMember" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    <display:column titleKey="common.id">
           <c:out value="${count}"/>
    </display:column>
    <display:column property="member.name" sortable="true" titleKey="machine.member" style="text-align:left"/>
    <display:column property="kind.caption_" sortable="true" titleKey="machine.kind" style="text-align:left"/>
    <display:column property="money" sortable="true" titleKey="machine.money" />
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
<form name="form1" action="saveMachine.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="machine.id" value="">
    <select name="selectedMachineIds" multiple="true" style="display:none"></select>
</form>
