<%@ include file="/common/taglibs.jsp"%>

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="evenLog.list"/></td>
      </tr>
      <tr class="cActionButtonLine">
        <td>
        <ww:if test="recordEditable == true">
            <button onclick="location.href='editEvenLog.html'" class="cButton"><fmt:message key="common.new"/></button>
            <ww:if test="functionOpenPeriodMessage != null">
                <span class="cLabel2">(<fmt:message key="common.function.openPeriod"/>: <ww:property value="functionOpenPeriodMessage"/>)</span>
            </ww:if>
            &nbsp;&nbsp;&nbsp;&nbsp;<button onclick="myCheckSubmitCopy('form1', <ww:property value="evenLogList.size()"/>, 'selectedEvenLogId', 'copyEvenLog.html', '<fmt:message key="common.mustSelectOne"/>', '<fmt:message key="common.mustSelectOnlyOne"/>')" class="cButton"><fmt:message key="common.copy"/></button>
        </ww:if>
        <ww:else>
            <button onclick="location.href='editEvenLog.html'" DISABLED class="cButton"><fmt:message key="common.new"/></button><span class="cLabel2">(<fmt:message key="common.function.openPeriodExceed"/> )</span>
        </ww:else>
        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="0" />
<display:table name="evenLogList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    <display:column property="perc" sortable="true" titleKey="evenLog.perc" />
    <display:column property="kw" sortable="true" titleKey="evenLog.kw" />
    <display:column property="shutdownprc.name" sortable="true" titleKey="shutdown.name" style="text-align:left"/>
    <display:column property="shutdownprc.evenlevel.name" sortable="true" titleKey="evenLevel.name" style="text-align:left"/>
    <display:column property="shutdownprc.evenlevel.messenger" sortable="true" titleKey="messenger.name" style="text-align:left"/>
    <display:column property="shutdownprc.evenlevel.messenger.securitys" sortable="true" titleKey="security.name" style="text-align:left"/>
    <display:column property="createdDate" sortable="true" titleKey="evenLog.time" style="text-align:left"/>
    
    <c:set var="count" value="${count+1}" />
</display:table>
        </td>
    </tr>
      <tr class="cActionButtonLine">
        <td>
        <ww:if test="recordEditable == true">
            <button onclick="location.href='editEvenLog.html'" class="cButton"><fmt:message key="common.new"/></button>
            <ww:if test="functionOpenPeriodMessage != null">
                <span class="cLabel2">(<fmt:message key="common.function.openPeriod"/>: <ww:property value="functionOpenPeriodMessage"/>)</span>
            </ww:if>
            &nbsp;&nbsp;&nbsp;&nbsp;<button onclick="myCheckSubmitCopy('form1', <ww:property value="evenLogList.size()"/>, 'selectedEvenLogId', 'copyEvenLog.html', '<fmt:message key="common.mustSelectOne"/>', '<fmt:message key="common.mustSelectOnlyOne"/>')" class="cButton"><fmt:message key="common.copy"/></button>
        </ww:if>
        <ww:else>
            <button onclick="location.href='editEvenLog.html'" DISABLED class="cButton"><fmt:message key="common.new"/></button><span class="cLabel2">(<fmt:message key="common.function.openPeriodExceed"/> )</span>
        </ww:else>
        </td>
      </tr>
</table>
<form name="form1" action="saveEvenLog.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="evenLog.id" value="">
    <select name="selectedEvenLogIds" multiple="true" style="display:none"></select>
</form>
