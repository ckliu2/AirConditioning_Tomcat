<%@ include file="/common/unsecureTaglibs.jsp"%>
   
<ww:set name="baseinfo" value="%{getBasicInfo()}"/>  
<form name="form1" method="post">
<table width="100%" border="0" class="cContentTitle">

<!--
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
  -->  
  <tr>
    <td bgcolor="#99FF66"><div align="center" class=""><fmt:message key='OGWebService.status.off'/></div></td>
    <td bgcolor="#FF0000"><div align="center" class=""><fmt:message key='OGWebService.status.on'/></div></td>
    <td bgcolor="#CCCCCC"><div align="center" class=""><fmt:message key='OGWebService.status.offline'/></div></td>
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
     </div>
     </td>
    <td><div align="left"></div></td>
    <td>
    
    </td>
  </tr>
</table>

<p>




<!------------------------------------------------------------------>

<c:set var="result" value="${building}"/>
<c:forEach var="row" items="${result}">
<ww:set name="space" value="%{getSpaceByBuilding(${row.id})}"/> 
<ww:set name="spacereader" value="%{getReaderListBySpace(${space.id})}"/> 

<!------------------------------------------------------------------>

<table width="100%" border="0" cellspacing="1" class="cContentTable" id="B${id}">    
  
 
<c:set var="count" value="0" />
<c:set var="i" value="0" />
 <c:forEach var="readers" items="${spacereader}">   
    <c:if test="${count%4==0}">
    <tr>    </c:if>  
       <td width="14%" nowrap="nowrap" bgcolor="#CCCCCC" id="${readers.id}" valign="top">

   
        <table width="100%" border="0">
          <tr>
           <td> 
            <div align="left">
                
                <strong>${readers.name}</strong> 
                <span align="left" id="dinlettemp${readers.id}" class="showTemp"/> 
               
                
             </div>
           </td>
           <td>                
                <div align="right">
                  <input type="button" name="button" id="button" value="ON" class="cButton"  onclick="setDevicePowerStatus('${readers.name}','${readers.id}','ON')"/>
                  <input type="button" name="button2" id="button2" value="OFF" class="cButton" onclick="setDevicePowerStatus('${readers.name}','${readers.id}','OFF')" />
                </div>
           </td>
          </tr>
          <tr>
            <td colspan="2" class="showTimeBox" align="center">            
            <div align="left" id="time${readers.id}"></div>  
               
           
            
            
             <!---------------------------排程------------------------------>            
            <a id="jttrigger-${i}" href="#"><img src="images/schedule.png" border="0"></a>
			      <div id="jttip-${i}" class="jttip" style="display:none;">
				    <div class="jttipcontent">
				       <span id="schedule${readers.id}"/>	
					   </div>
		        </div>            
            <!---------------------------排程------------------------------>
            
            <c:set var="i" value="${i+1}" />        
            
            <!---------------------------設備屬性------------------------------>            
            <a id="jttrigger-${i}" href="#"><img src="images/settings.png" border="0"></a>
			      <div id="jttip-${i}" class="jttip" style="display:none;">
				    <div class="jttipcontent">
				       <span id="setting${readers.id}"/>	
					   </div>
		        </div>            
            <!---------------------------設備屬性------------------------------>
        
            </td>
          </tr>
        </table>         
        
        </td> 
     <c:if test="${count%4==6}">
         </tr>
     </c:if>   
     <c:if test="${count==fn:length(space.reader)-1}">
         </tr>
      </c:if>	     
     <c:set var="count" value="${count+1}" />   
     <c:set var="i" value="${i+1}" />   
 </c:forEach>  
</table>

<P></P>
<HR>
</c:forEach> 

<p>
  <script type="text/javascript" src="${ctx}/scripts/powerStatus.js"></script>
  <script>	
	function setDevicePowerStatus(door,readerId,ps){
	  var msg="<fmt:message key='OGWebService.msg1'/>"+'\n'+door+' '+ps+'?';
	  	if(confirm(msg)){			
	  		 var u="setDevicePowerStatus.html?readerId="+readerId+"&ps="+ps;
	  	   alert("已傳送至伺服器，請稍候畫面才會更新");
			   sendRequest(u);
        }  
	}

	window.setInterval("sendRequest('status.xml','getStatusXML')",1000); 	
	
</script>

</form>


