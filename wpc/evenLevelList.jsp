<%@ include file="/common/taglibs.jsp"%>

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="evenLevel.list"/></td>
      </tr>
      <tr class="cActionButtonLine">
        <td>
        <ww:if test="recordEditable == true">
            <button onclick="location.href='editEvenLevel.html'" class="cButton"><fmt:message key="common.new"/></button>
            <ww:if test="functionOpenPeriodMessage != null">
                <span class="cLabel2">(<fmt:message key="common.function.openPeriod"/>: <ww:property value="functionOpenPeriodMessage"/>)</span>
            </ww:if>
            &nbsp;&nbsp;&nbsp;&nbsp;<button onclick="myCheckSubmitCopy('form1', <ww:property value="evenLevelList.size()"/>, 'selectedEvenLevelId', 'copyEvenLevel.html', '<fmt:message key="common.mustSelectOne"/>', '<fmt:message key="common.mustSelectOnlyOne"/>')" class="cButton"><fmt:message key="common.copy"/></button>
        </ww:if>
        <ww:else>
            <button onclick="location.href='editEvenLevel.html'" DISABLED class="cButton"><fmt:message key="common.new"/></button><span class="cLabel2">(<fmt:message key="common.function.openPeriodExceed"/> )</span>
        </ww:else>
        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="1" />
<display:table name="evenLevelList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    <display:column titleKey="common.select">
        <input type="checkbox" id="selectedEvenLevelId_<c:out value="${count}"/>" name="selectedEvenLevelId" value="<c:out value="${row.id}"/>">
    </display:column>
    
    <display:column titleKey="common.id" style="text-align:left" sortable="true">     
        <c:out value="${count}"/>
     </display:column>
     
    <display:column property="name" sortable="true" titleKey="evenLevel.name" style="text-align:left" />
    <display:column property="shortMessage" sortable="true" titleKey="evenLevel.shortMessage" style="text-align:left" />
    <display:column property="longMessage" sortable="true" titleKey="evenLevel.longMessage" style="text-align:left" />
    
    <display:column property="messenger" sortable="true" titleKey="messenger.name" style="text-align:left" />
    
    <display:column property="createdDate" sortable="true" titleKey="common.createdDate" style="text-align:left"/>
    
    <display:column property="member.name" sortable="true" titleKey="common.lastModifiedUser" style="text-align:left"/>
    <display:column property="createdUser.name" sortable="true" titleKey="common.createdUser" style="text-align:left"/>
    
    
    <display:column titleKey="common.action">
        <ww:if test="recordEditable == true">
            <a href="editEvenLevel.html?evenLevel.id=<c:out value="${row.id}"/>"><fmt:message key="common.edit"/></a>&nbsp;&nbsp;
            <a href="#" onClick="javascript:return myConfirm('<fmt:message key="common.confirmDelete1"/><c:out value="${row.name}" /><fmt:message key="common.confirmDelete2"/>', 'form1', 'evenLevel.id', '${row.id}')"><fmt:message key="common.delete"/></a>
        </ww:if>
        <ww:else>
           <a href="editEvenLevel.html?evenLevel.id=<c:out value="${row.id}"/>"><fmt:message key="common.view"/></a>&nbsp;&nbsp;
        </ww:else>
    </display:column>
    <c:set var="count" value="${count+1}" />
</display:table>
        </td>
    </tr>
      <tr class="cActionButtonLine">
        <td>
        <ww:if test="recordEditable == true">
            <button onclick="location.href='editEvenLevel.html'" class="cButton"><fmt:message key="common.new"/></button>
            <ww:if test="functionOpenPeriodMessage != null">
                <span class="cLabel2">(<fmt:message key="common.function.openPeriod"/>: <ww:property value="functionOpenPeriodMessage"/>)</span>
            </ww:if>
            &nbsp;&nbsp;&nbsp;&nbsp;<button onclick="myCheckSubmitCopy('form1', <ww:property value="evenLevelList.size()"/>, 'selectedEvenLevelId', 'copyEvenLevel.html', '<fmt:message key="common.mustSelectOne"/>', '<fmt:message key="common.mustSelectOnlyOne"/>')" class="cButton"><fmt:message key="common.copy"/></button>
        </ww:if>
        <ww:else>
            <button onclick="location.href='editEvenLevel.html'" DISABLED class="cButton"><fmt:message key="common.new"/></button><span class="cLabel2">(<fmt:message key="common.function.openPeriodExceed"/> )</span>
        </ww:else>
        </td>
      </tr>
</table>
<form name="form1" action="saveEvenLevel.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="evenLevel.id" value="">
    <select name="selectedEvenLevelIds" multiple="true" style="display:none"></select>
</form>
