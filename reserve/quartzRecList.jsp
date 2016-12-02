<%@ include file="/common/taglibs.jsp"%>
<form  method="post">
<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="quartzRec.list"/></td>
      </tr>
      <tr class="cActionButtonLine">
        <td>
            <ww:select name="week" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelectWeek')}..."
               list="weekList"
               listKey="id"
               listValue="value"
               cssClass="cInputListField"
            />
            
            <ww:select name="lesson" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelectLesson')}..."
               list="lessonList1"
               listKey="id"
               listValue="value"
               cssClass="cInputListField"
            />
            
            <ww:select name="readerId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelectReader')}..."
               list="readerList1"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            />
            
            <input type="submit" value="<fmt:message key="common.search"/>" class="cButton">
        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="0" />
<display:table name="quartzRecList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    <display:column property="quartzDate" sortable="true" titleKey="quartzRec.quartzDate" style="text-align:left" />
    <display:column titleKey="quartz.week">
       <ww:set name="ck" value="%{getChineseWeek(${row.week})}"/>
       ${ck}  
    </display:column>      
    <display:column property="classTime.lesson" sortable="true" titleKey="quartz.lesson" style="text-align:left"/>
    <display:column property="classTime.beginTime" sortable="true" titleKey="quartz.beginTime" style="text-align:left"/>
    <display:column property="classTime.endTime" sortable="true" titleKey="quartz.endTime" style="text-align:left"/>
    <display:column property="classTime.downloadBeginTime" sortable="true" titleKey="quartz.downloadbeginTime" style="text-align:left"/>
    <display:column property="classTime.downloadEndTime" sortable="true" titleKey="quartz.CleanTime" style="text-align:left"/>
    
    <display:column property="classInfo.reader" sortable="true" titleKey="quartz.class" style="text-align:left"/>
    <display:column property="classInfo.course.name" sortable="true" titleKey="quartz.classname" style="text-align:left"/>
    <display:column property="teacher.name" sortable="true" titleKey="quartz.teacher" style="text-align:left"/>
    <display:column property="students" sortable="true" titleKey="quartz.students" style="text-align:left" />
    <display:column titleKey="common.action">
      <a href="editQuartzRec.html?quartzRec.id=${row.id}  " target="_blank">  <fmt:message key='common.view'/>  </a>    </display:column>
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

