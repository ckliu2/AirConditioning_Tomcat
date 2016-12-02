<%@ include file="/common/unsecureTaglibs.jsp"%>
<style type="text/css">
<!--
.style1 {color: #0000FF}
.style2 {color: #FF0000}
-->
</style>




<form name="form1" method="post">
<p>
            <ww:select name="buildingId" 
               headerKey=""
               headerValue="%{getText('OGWebService.common.pleaseSelect')}..."
               list="buildingList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            />  

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
           
            
            <ww:checkbox name="currentClass" fieldValue="true" /> <span class="cLabel">(<fmt:message key='quartzRec.current.class'/>)</span>


            <input type="submit" value="<fmt:message key='common.search'/>"/>
<!------------------------------------------------------------------>

<c:set var="result" value="${building}"/>
<c:forEach var="row" items="${result}">
<ww:set name="space" value="%{getSpaceByBuilding(${row.id})}"/> 
<ww:set name="currentclassList" value="%{getCurrentClassList(${row.id})}"/>
<!------------------------------------------------------------------>

<table width="80%" border="0" cellspacing="1" class="cContentTable" id="B${id}">    
  
 <tr>
       <td colspan="7" nowrap="nowrap">
            <div align="center" class="cContentTitle">
              <div align="left">
                <table width="100%" border="0">

                   <tr>
                     <td width="66%" colspan="2" nowrap="nowrap"><div align="center">${row.name}</div></td>
                   </tr>
                 </table>
              </div>
           </div>       </td>
  </tr>  


  <tr>
     <td colspan="3" nowrap="nowrap">
        <table width="100%" border="1"  cellspacing="1" class="cContentTable" >
          <tr class="cActionButtonLine">
             <td colspan="4"><div align="center"><fmt:message key='quartz.classinfo'/></div></td>
             <td colspan="6"><div align="center"><fmt:message key='quartz.lesson.basic'/></div></td>
           </tr>
           <tr class="cActionButtonLine">
              <td width="11%"><fmt:message key='reader.name'/></td>           
              <td width="32%"><fmt:message key='quartz.classname'/></td>
              <td width="21%"><fmt:message key='quartz.teacher'/></td>
              <td width="21%"><fmt:message key='quartz.students'/></td>
             
              <td width="21%"><fmt:message key='quartz.week'/></td>
              <td width="21%"><fmt:message key='quartz.lesson'/></td>
              <td width="21%"><fmt:message key='quartz.beginTime'/></td>
              <td width="21%"><fmt:message key='quartz.endTime'/></td>
              <td width="21%"><fmt:message key='quartz.downloadbeginTime'/></td>
              <td width="21%"><fmt:message key='quartz.CleanTime'/></td>
          </tr>
          <c:set var="count" value="1" />
          <c:forEach var="readers" items="${currentclassList}">    <%--  ${space.reader} --%>
          <c:set var="ukey" value='${fn:replace(readers.name,"-","")}' />    
          
          <ww:set name="rd" value="%{getReaderByName('${readers.name}')}"/>         
          <ww:set name="classInfo" value="%{getClassInfoListByQuartz( ${rd.id} )}"/>
          <ww:set name="ck" value="%{getChineseWeek(${week})}"/>
          
          <ww:set name="classTime" value="%{getClassTimeByWeekLesson()}"/>
          
         

          
          <tr class="cInputCaption">
              <td>${readers.name}</td>           
              <td>${classInfo.course.name}</td>
              <td>${classInfo.teacher} </td>
              <td width="10%">[${fn:length(classInfo.students)}]<br>
              
              </td>
              <td bgcolor="#FFCCCC"><span class="style1">${ck}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classTime.lesson}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classTime.beginTime}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classTime.endTime}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classTime.downloadBeginTime}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classTime.downloadEndTime}</span></td>
            </tr>
          
          
            <c:set var="count" value="${count+1}" />   
          </c:forEach>  
        </table>
     </td>
  </tr>

</table>

<P></P>

</c:forEach> 



</form>
