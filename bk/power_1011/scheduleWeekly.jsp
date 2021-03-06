<%@ include file="/common/unsecureTaglibs.jsp"%>


<%--
<ww:set name="ls" value="%{getDeviceWeekly()}"/>  
<c:set var="count" value="0" /> 
<c:set var="quote" value="," /> 
<ww:iterator value="ls">

  <ww:if test="${fn:length(ls)}-1 == ${count}">
    <c:set var="quote" value="" /> 
  </ww:if>
  
[${count}${calendar.time.day}--${calendar.time.year+1900},${calendar.time.month},${calendar.time.date},${hour},${minute},${Drive},${SetTemp},${Mode},${SetTempItem}]---${quote}<br>
 
 
 <c:set var="count" value="${count+1}" />
</ww:iterator> 
--%>

<ww:set name="reader" value="%{getReaderById()}"/> 

<div align="center" class="cTitle">
${reader.name} 課表排程
</div>	


<STYLE type="text/css">
        body {
            font-size: 10pt;
            font-family: verdana, sans, arial, sans-serif;
        }
</STYLE>
     
<SCRIPT src="${ctx}/scripts/timeline.js" type="text/javascript"></SCRIPT>
<LINK href="${ctx}/css/timeline.css" rel="stylesheet" type="text/css">  

<form name="form1" method="post">
<p>

 <ww:select name="week"  onchange="javascript:query()"
               headerKey=""
               headerValue="%{getText('請選擇星期')}..."
               list="weekList"
               listKey="id"
               listValue="value"
               cssClass="cInputListField"
            />  
            
<ww:set name="ls" value="%{getClassScheduleWeeklyByReader('${reader.id}','${week}')}"/>  

<c:set var="count" value="1" />
<c:set var="tip" value="0" />

<p>

<display:table name="ls" class="list1" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    <display:column titleKey="common.id">
       ${count}
    </display:column>
    
    <display:column property="course.name" title="課程名稱" style="text-align:left"/> 
    	    
    <display:column title="節次">
       ${row.node}
    </display:column>
    
    <display:column title="上課時間">
       ${row.startTime}~${row.endTime}
    </display:column>
    
    <display:column title="預約時段">    
       <font color="blue"><strong>${row.reservation}</strong></font>
    </display:column>
    
    <display:column title="冷氣控制">    
      <c:choose>
        <c:when test="${row.active=='on'}">
                  
         <a id="jttrigger-${tip}" href="#">ON</a>
			   <div id="jttip-${tip}" class="jttip" style="display:none;">
				  <div class="jttipcontent" >
					   是否開啟:開起 <br>
		         設定溫度:${reader.temp} <br>
		         冷氣模式:${reader.mode} <br>
		         准許手動控制開關:${reader.driveItem} <br>
		         准許手動更改冷氣模式:${reader.modeItem} <br>
					</div>
					<c:set var="tip" value="${tip+1}" />
					
        </c:when>
        
        <c:when test="${row.active=='off'}">
         <a id="jttrigger-${tip}" href="#">OFF</a>
			   <div id="jttip-${tip}" class="jttip" style="display:none;">
				  <div class="jttipcontent" >
					   是否開啟:關閉 <br>
		         設定溫度:${reader.temp} <br>
		         冷氣模式:${reader.mode} <br>
		         准許手動控制開關:${reader.driveItem} <br>
		         准許手動更改冷氣模式:${reader.modeItem} <br>
					</div>
					<c:set var="tip" value="${tip+1}" />
        </c:when>
        
        <c:otherwise>
          --
        </c:otherwise>

      </c:choose>
      
    </display:column>
    	
    <c:set var="count" value="${count+1}" />
    
</display:table>

</form>

<script>

function query(){
	form1.submit();
}

</script>


    
    



