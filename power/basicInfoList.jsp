<%@ include file="/common/taglibs.jsp"%>

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="basicInfo.list"/></td>
      </tr>

        <td>
<c:set var="count" value="0" />
<display:table name="basicInfoList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />

    <display:column property="contract" sortable="true" titleKey="basicInfo.contract" />
    <display:column property="createdDate" sortable="true" titleKey="common.createdDate" style="text-align:left"/>
    <display:column property="createdUser" sortable="true" titleKey="common.createdUser" style="text-align:left"/>
    <display:column titleKey="common.action">
        <ww:if test="recordEditable == true">
            <a href="editBasicInfo.html?basicInfo.id=<c:out value="${row.id}"/>"><fmt:message key="common.edit"/></a>&nbsp;&nbsp;
            
        </ww:if>
        <ww:else>
           <a href="editBasicInfo.html?basicInfo.id=<c:out value="${row.id}"/>"><fmt:message key="common.view"/></a>&nbsp;&nbsp;
        </ww:else>
    </display:column>
    <c:set var="count" value="${count+1}" />
</display:table>
        </td>
    </tr>

</table>
<form name="form1" action="saveBasicInfo.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="basicInfo.id" value="">
    <select name="selectedBasicInfoIds" multiple="true" style="display:none"></select>
</form>
