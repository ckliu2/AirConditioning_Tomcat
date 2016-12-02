<%@ include file="/common/taglibs.jsp"%>

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="quartz.lesson.basic"/></td>
      </tr>
      
      <tr>
        <td>
<c:set var="count" value="0" />
<display:table name="classTimeList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="50" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    <display:column property="lesson" sortable="true" titleKey="quartz.lesson" />
    <display:column property="beginTime" sortable="true" titleKey="quartz.beginTime" style="text-align:left" />
    <display:column property="endTime" sortable="true" titleKey="quartz.endTime" style="text-align:left" />
    <display:column property="downloadBeginTime" sortable="true" titleKey="quartz.downloadbeginTime" style="text-align:left" />
    <display:column property="downloadEndTime" sortable="true" titleKey="quartz.CleanTime" style="text-align:left" />
    <display:column property="weekEnd" sortable="true" titleKey="quartz.week" />

<%--
    <display:column titleKey="common.action">

<c:choose>
<c:when test="${weekEnd == 0}">¡@ 
      <fmt:message key="quartz.msg4"/>
</c:when>

<c:when test="${weekEnd == 1}">¡@ 
      <fmt:message key="quartz.msg5"/>
</c:when>
<c:otherwise>
  <fmt:message key="quartz.msg6"/>
</c:otherwise>
</c:choose>

</display:column>
--%>

    <c:set var="count" value="${count+1}" />
</display:table>



        </td>
    </tr>

</table>

<p>

<span class="cLabel">
<fmt:message key="quartz.msg1"/> <br>
<fmt:message key="quartz.msg2"/> <br>
<fmt:message key="quartz.msg3"/> 
</span>

<form name="form1" action="saveClassTime.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="classTime.id" value="">
    <select name="selectedClassTimeIds" multiple="true" style="display:none"></select>
</form>
