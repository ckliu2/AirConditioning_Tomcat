<%@ include file="/common/unsecureTaglibs.jsp"%>


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
    <td><div align="right"><span class="cLabel"> <a href="powerStatusList.html"><img src="./images/switch.jpg" name="stus${ukey}" width="15" border="0" id="stus${ukey}"/></a> [
      <fmt:message key='OGWebService.view.switch'/>]</span></div></td>
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
                     <td width="33%" nowrap="nowrap">
                     <input type="button" name="button" id="button" value="<fmt:message key='OGWebService.closeAll'/>" class="cButton"  onclick="setDevicePower('${row.id}','OFF','${row.name}')"/>
                     <input type="button" name="button2" id="button2" value="<fmt:message key='OGWebService.openAll'/>" class="cButton" onclick="setDevicePower('${row.id}','ON','${row.name}')" />                     </td>
                     <td width="33%" nowrap="nowrap"><div align="center">${row.name}</div></td>
                     <td width="33%" nowrap="nowrap">
                       <img  src="./images/Break.jpg" width="15"/> <span class="cLabel">[<fmt:message key='OGWebService.status.offline1'/>]</span> &nbsp;&nbsp;
                       <img  src="./images/on.jpg" width="15"/><span class="cLabel">[<fmt:message key='OGWebService.status.on1'/>]</span>&nbsp;&nbsp;
                       <img  src="./images/off.jpg" width="15"/><span class="cLabel">[<fmt:message key='OGWebService.status.off1'/>]</span>
                     
                     </td>
                   </tr>
                 </table>
              </div>
           </div>       </td>
  </tr>  


  <tr>
     <td colspan="3" nowrap="nowrap">
        <table width="100%" border="1"  cellspacing="1" class="cContentTable" >
           <tr class="cActionButtonLine">
              <td width="2%"><fmt:message key='common.id'/></td>
             <td width="5%"><fmt:message key='shutdown.status'/></td>
              <td width="8%"><fmt:message key='reader.name'/></td>
              <td width="10%"><fmt:message key='shutdown.recievetime'/></td>
              <td width="5%"><fmt:message key='shutdown.RemoteON'/></td>
              <td width="5%"><fmt:message key='shutdown.RemoteOFF'/></td>
              <td><fmt:message key='common.remark'/></td>    
          </tr>
          <c:set var="count" value="1" />
          <c:forEach var="readers" items="${space.reader}">  
          <c:set var="ukey" value='${fn:replace(readers.name,"-","")}' />    
          <tr class="cInputCaption">
              <td>${count}</td>
              <td id="${ukey}" bgcolor="">
                <div align="center"><img id="stus${ukey}" src="./images/Break.jpg" width="15"/>
                </div></td>
              <td>${readers.name}</td>
              <td><div align="left" id="time${ukey}"></div></td>
              <td>
              
                <div align="left">
                  <input type="button" name="button" id="button" value="ON" class="cButton"  onclick="setDevicePowerStatus('${readers.name}', 'ON')"/>              
                  </div></td>
              <td>
              
                <div align="left">
                  <input type="button" name="button2" id="button2" value="OFF" class="cButton" onclick="setDevicePowerStatus('${readers.name}', 'OFF')" />              
                  </div></td>
              <td>             
                  <div align="left" id="info${ukey}"></div>              </td>
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
  <script type="text/javascript" src="${ctx}/scripts/powerStatus1.js"></script>
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
