<%@ include file="/common/unsecureTaglibs.jsp"%>
<style type="text/css">
<!--
.style1 {color: #0000FF}
.style2 {color: #FF0000}
-->
</style>



<ww:set name="baseinfo" value="%{getBasicInfo()}"/>  
<form name="form1" method="post">
<table width="100%" border="0" class="cContentTitle">
  <tr>
    <td width="33%"><div align="center"><fmt:message key='OGWebService.Contract.Capacity'/>(KW)</div></td>
    <td width="33%"><div align="center"><fmt:message key='OGWebService.Instant.Power'/>(KW)</div></td>
    <td width="33%"><div align="center"><fmt:message key='OGWebService.power.use'/>(%)</div></td>
  </tr>
  <tr>
    <td>

    
      <div align="center">${baseinfo.contract} </div></td>
    <td><div align="center" id="power"/></td>
    <td><div align="center" id="usepec"/></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><div align="center"><fmt:message key='OGWebService.time1'/></div></td>
    <td bgcolor="#FFFFFF"><div align="center"><fmt:message key='OGWebService.time2'/></div></td>
    <td bgcolor="#FFFFFF"><div align="center" id="onStatus"/></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><div align="center" id="cc"/></td>
    <td bgcolor="#FFFFFF"><div align="center" id="recdate"/></td>
    <td bgcolor="#FFFFFF"><div align="center" id="offStatus"/></td>
  </tr>
  
  
  <tr>
    <td colspan="3" id="EventT">
        <div align="center" id="shutmsg"/>    </td>
  </tr>
  <tr>
    <td><div align="left">
                <ww:select name="buildingId"  onchange="javascript:go()"
               headerKey=""
               headerValue="%{getText('OGWebService.common.pleaseSelect')}..."
               list="buildingList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            />    
     </div>     </td>
    <td><div align="left"></div></td>
    <td><div align="right"><img  src="./images/Break.jpg" width="15"/> <span class="cLabel">[
          <fmt:message key='OGWebService.status.offline1'/>
          ]</span> &nbsp;&nbsp; <img  src="./images/on.jpg" width="15"/><span class="cLabel">[
          <fmt:message key='OGWebService.status.on1'/>
          ]</span>&nbsp;&nbsp; <img  src="./images/off.jpg" width="15"/><span class="cLabel">[
          <fmt:message key='OGWebService.status.off1'/>
          ]</span></div></td>
  </tr>
</table>

<p>

<%--

<ww:set name="buildingList" value="%{getBuildingList()}"/>  
<ww:iterator value="buildingList"> 
<ww:set name="space" value="%{getSpaceByBuilding(id)}"/>  

readers3 =${fn:length(space.reader)-1}  <br>


<c:set var="count" value="0" />
<c:forEach var="readers" items="${space.reader}">   
    <c:if test="${count%7==0}">
         TR 
    </c:if>
     TD[${readers.name}]TD/
     
   <c:if test="${count%7==6}">
        /TR
   </c:if>
   
   <c:if test="${count==fn:length(space.reader)-1}">
        /TR
   </c:if>	
     
 <c:set var="count" value="${count+1}" />   
</c:forEach>  

<c:set var="result" value="${building}"/>
<c:forEach var="row" items="${result}"> 
 ${row.id}--<br>
 </c:forEach> 
--%>
<!------------------------------------------------------------------>

<c:set var="result" value="${building}"/>
<c:forEach var="row" items="${result}">
<ww:set name="space" value="%{getSpaceByBuilding(${row.id})}"/> 

<!------------------------------------------------------------------>

<table width="100%" border="0" cellspacing="1" class="cContentTable" id="B${id}">    
  
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
             <td colspan="4"><div align="center" ><fmt:message key='quartz.reader.basic'/></div></td>
             <td colspan="4"><div align="center"><fmt:message key='quartz.classinfo'/></div></td>
             <td colspan="6"><div align="center"><fmt:message key='quartz.lesson.basic'/></div></td>
             <td colspan="2"><div align="center"><fmt:message key='quartz.gcu'/></div></td>
           </tr>
           <tr class="cActionButtonLine">
             <td width="10%">&nbsp;</td>
              <td width="10%"><fmt:message key='common.id'/></td>
             <td width="4%"><fmt:message key='shutdown.status'/></td>
             <td width="11%"><fmt:message key='shutdown.recievetime'/></td>
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
              <td width="21%"><fmt:message key='quartz.gcu.downloadtime'/></td>
              <td width="21%"><fmt:message key='quartz.gcu.downgcumembers'/></td>
          </tr>
          <c:set var="count" value="1" />
          <c:forEach var="readers" items="${space.reader}">  
          <c:set var="ukey" value='${fn:replace(readers.name,"-","")}' />    
          
          <ww:set name="rd" value="%{getReaderByName('${readers.name}')}"/>         
          <ww:set name="classInfo" value="%{getClassInfoListByQuartz( ${rd.id} )}"/>
          <ww:set name="ck" value="%{getChineseWeek(${classInfo.week})}"/>
          
          <ww:set name="quartzRec" value="%{getQuartzRecByLastUpdate( ${classInfo.id} )}"/>


          
          <tr class="cInputCaption">
            <td bgcolor="#CCCCFF">${classInfo.id}</td>
              <td bgcolor="#CCCCFF"><span class="style1">${count}</span></td>
              <td id="${ukey}" bgcolor="#CCCCFF">
                <div align="center" class="style1"><img id="stus${ukey}" src="./images/Break.jpg" width="15"/>                </div></td>
              <td bgcolor="#CCCCFF"><div align="left" class="style1" id="time${ukey}"></div></td>
              <td>${readers.name}</td>
           
              <td>${classInfo.course.name}</td>
              <td>${classInfo.teacher} </td>
              <td>[${fn:length(classInfo.students)}]</td>
            
             
              
              
              
              
              <td bgcolor="#FFCCCC"><span class="style1">${ck}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classInfo.classTime.lesson}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classInfo.classTime.beginTime}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classInfo.classTime.endTime}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classInfo.classTime.downloadBeginTime}</span></td>
              <td bgcolor="#FFCCCC"><span class="style1 style1 style1">${classInfo.classTime.downloadEndTime}</span></td>
              <td bgcolor="#A8E28B"><div id="timeE0105" align="left">${quartzRec.createdDate}</div></td>
              <td bgcolor="#A8E28B"><span class="style2">[  <a href="editQuartzRec.html?quartzRec.id=${quartzRec.id}" target="_blank">${quartzRec.downloadMembers} </a>]</span></td>
            </tr>
          
          
            <c:set var="count" value="${count+1}" />   
          </c:forEach>  
        </table>
     </td>
  </tr>

</table>

<P></P>

</c:forEach> 

<p>
  <script type="text/javascript" src="${ctx}/scripts/reserve.js"></script>
  <script>	
	function setDevicePowerStatus(door,ps){
	  var msg="<fmt:message key='OGWebService.msg1'/>"+'\n'+door+' '+ps+'?';
	  	if(confirm(msg)){			
			sendRequest("setDevicePowerStatus.html?door="+door+"&ps="+ps,"devicePowerStatus");
        }  
	}
	
	function setDevicePower(buildingId,ps,name){
	  var msg="<fmt:message key='OGWebService.msg4'/>"+'\n'+name+' '+ps+'?';	
	  	if(confirm(msg)){	
			sendRequest2("setDevicePower.html?buildingId="+buildingId+"&ps="+ps,"devicePower");
        }  
	}
	
   
    function poweruse(){
	   var power=document.all.power.innerHTML;
	   var contract=${baseinfo.contract};
	   var usepec=(power/contract)*100;
	   document.all.usepec.innerHTML=Math.round(usepec);
	}   
	
	 function go(){
	   form1.submit();
	   //alert('go..');
	 }

    
    window.setInterval("poweruse()",2000);    
	window.setInterval("sendRequest('status.xml','getStatusXML')",1000); 	
	window.setInterval("sendRequest1('InstantPower.xml','getInstantPowerXML')",2000);  
	window.setInterval("sendRequest3('Event.xml','shutdown')",2000); 
	now();       // 取得現在時間
</script>

</form>
