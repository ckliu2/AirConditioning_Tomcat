<%@ include file="/common/unsecureTaglibs.jsp"%>



<form name="form1" method="post">
<table width="100%" border="0" class="cContentTitle">

  <tr>
    <td colspan="2">
     <table width="100%" border="1">
       <tr>
        <td bgcolor="#CCCCCC" width="20%"><div align="center">連線中斷</div></td>
        <td bgcolor="#F5F5F5" width="20%"><div align="center">未開啟</div></td>
        <td bgcolor="#BBBBFF" width="20%"><div align="center">課表排程開啟</div></td>
        <td bgcolor="#FF9966" width="20%"><div align="center">手動排程開啟</div></td>
        <td bgcolor="#CC0000" width="20%"><div align="center">異常開啟</div></td>
       </tr>
      </table>    
   </td>
  </tr>
 

  <tr>
    <td><div align="left">
            <ww:select name="buildingId"  onchange="javascript:go()"
               headerKey=""
               headerValue="%{getText('請選擇全部區域')}....."
               list="buildingList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            />   
            
            <ww:select name="readerStateId"  onchange="javascript:go()"
               headerKey=""
               headerValue="%{getText('請選擇全部狀態')}....."
               list="readerState"
               listKey="id"
               listValue="valueTw"
               cssClass="cInputListField"
            />  
     </div>     
     </td>
    
    <td>
     <div align="right">
       <input type=button onclick="javascript:history.back()" class="cButton" value="回上一頁" />
       &nbsp;&nbsp;
       <input type=button onclick="javascript:window.close()" class="cButton" value="關閉本視窗" />
     </div>
    </td>
  </tr>
</table>

<p>




<!------------------------------------------------------------------>

<c:set var="result" value="${building}"/>
<c:forEach var="row" items="${result}">
<ww:set name="space" value="%{getSpaceByBuilding(${row.id})}"/> 
<ww:set name="spacereader" value="%{getReaderListBySpace(${space.id})}"/> 

<div align="center"><strong>${space.name}</strong></div>
<br>
<!------------------------------------------------------------------>

<table width="100%" border="1" cellspacing="1" class="cContentTable" id="B${id}">    
  
 
<c:set var="count" value="0" />
<c:set var="i" value="0" />
 <c:forEach var="sr" items="${spacereader}">  
 
  <c:if test="${count%4==0}">
    <tr>    
  </c:if>  
       <td width="14%" nowrap="nowrap" bgcolor="#CCCCCC" id="${sr.reader.id}" valign="top">
       
   <table width="100%" border="0" bordercolor="#000000" ><tr><td><div align="left">
   
            
            
        <table width="100%" border="0">  <tr>
           <td> 
            <div align="left">
            
            <c:if test="${sr.powercontroller.deviceTypeId==45}">
                
                <a id="jttrigger-${i}"><img src="images/deconnection.png" height="16" border="0" id="devicestatus${sr.reader.id}" /></a>
			          <div id="jttip-${i}" class="jttip" style="display:none;">
				          <div class="jttipcontent">
				             <span id="classname${sr.reader.id}"/>	
					        </div>
		            </div> 
		      
            </c:if>    
            
            <c:set var="i" value="${i+1}" /> 
             
                <strong>${sr.reader.name}</strong> 
                <span align="left" id="dinlettemp${sr.reader.id}" class="showTemp"/> 
             </div>
           </td> 
           <td>                
                <div align="right">                  
                   <input type="button" name="ON${sr.reader.id}" id="ON${sr.reader.id}" value="ON" class="cButton"  onclick="setDevicePowerStatus('${sr.reader.name}','${sr.reader.id}','ON','啟動')"/>
                   <input type="button" name="OFF${sr.reader.id}" id="OFF${sr.reader.id}" value="OFF" class="cButton" onclick="setDevicePowerStatus('${sr.reader.name}','${sr.reader.id}','OFF','關閉')" />
                </div>
           </td>
          </tr>
          <tr>
            <td colspan="2" class="showTimeBox" align="center">            
            <div align="left" id="time${sr.reader.id}"></div>  
            
               
           <c:if test="${sr.powercontroller.deviceTypeId==45}">
           	
           
          
            
            <!---------------------------排程------------------------------>            
            <a id="jttrigger-${i}"><img src="images/schedule.png" id="scheduleICON${sr.reader.id}" border="0" title="檢視排程"/></a>
			      <div id="jttip-${i}" class="jttip" style="display:none;">
				    <div class="jttipcontent">
				       <span id="schedule${sr.reader.id}"/>	
					   </div>
		        </div> 
		          
		        &nbsp;&nbsp;&nbsp;&nbsp;
            <!---------------------------排程------------------------------>
            
            <c:set var="i" value="${i+1}" />        
            
            <!---------------------------設備屬性------------------------------>            
            <a id="jttrigger-${i}"><img src="images/settings.png" id="settingICON${sr.reader.id}" border="0" title="設備屬性"/></a>
			      <div id="jttip-${i}" class="jttip" style="display:none;">
				    <div class="jttipcontent">
				       <span id="setting${sr.reader.id}"/>	
					   </div>
		        </div>   
		        
		        &nbsp;&nbsp;&nbsp;&nbsp;         
            <!---------------------------設備屬性------------------------------>
            
            <c:set var="i" value="${i+1}" />
            
            <!---------------------------是否啟用------------------------------>
            <c:set var="active" value="" />
            <c:set var="activemsg" value="" />
            <ww:if test="${sr.reader.active == true}">              
              <c:set var="active" value="active.png" />
              <c:set var="activemsg" value="套用課表" />
            </ww:if>
            <ww:else>              
              <c:set var="active" value="none.png" />
              <c:set var="activemsg" value="不套用課表" />
            </ww:else>
            
            <a id="jttrigger-${i}"><img src="images/${active}" id="activeICON${sr.reader.id}" border="0" title="是否套用課表排程" /></a>
			      <div id="jttip-${i}" class="jttip" style="display:none;">
				    <div class="jttipcontent">
				       ${activemsg}	
					   </div>
		        </div>
		        
		       &nbsp;&nbsp;&nbsp;&nbsp;
		       
		       <!---------------------------Information------------------------------>
		       <c:set var="i" value="${i+1}" />
		        <a id="jttrigger-${i}"><img src="images/info.png" border="0" title="其他資訊"/></a>
			      <div id="jttip-${i}" class="jttip" style="display:none;">
				    <div class="jttipcontent">
				       <span id="info${sr.reader.id}"/>	
					   </div>
		        </div> 
		       <!---------------------------Information------------------------------>
		         
		         
		        
            
           </c:if> 
           
            </td>
          </tr>
        </table>  
        
        
        </div></td></tr></table>       
        
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

</c:forEach> 

<p>
  <script type="text/javascript" src="${ctx}/scripts/powerStatus.js" id="ps" poweruser="${sessionUser.role}"></script>
  
  <script>	
  function setDevicePowerStatus(door,readerId,ps,pschinese){  
	  var msg='是否確定'+pschinese+door+'冷氣?';
	  	if(confirm(msg)){			
	  		 var u="setDevicePowerStatus.html?readerId="+readerId+"&ps="+ps;
	  		 //alert(u);
	  	     $.ajax({
            url: u,
            type: "GET",
            dataType: "json",
            success: function(data) {
            	var powerstatus=data[0].powerstatus;
              var state=data[0].state;
            	var info=data[0].info;
            	var id=data[0].id;
            	var countroltime=data[0].countroltime;
            
				      //即時更新畫面
            	var devicestatus=eval('document.all.devicestatus'+id);			
              if(powerstatus==false){				   	 	 
					   	 	 devicestatus.src='images/driveOff.png';					   	 
					   	 }else{					   		 
					   		 devicestatus.src='images/driveON.png';					   	
					   	 } 
					   	 document.getElementById(id).style.backgroundColor=state;
					   	 var time=eval('document.all.time'+id);
				       time.innerHTML=countroltime;   
				            
            }
          }); 
       }  
	}
	
  
  
  function go(){
	   form1.submit();	  
	}

	
	window.setInterval("isReflash()",60000);
	sendRequest('status.xml','getStatusXML'); 
  sendRequest1('status1.xml','getStatusXML1');  
  window.setInterval("sendRequest('status.xml','getStatusXML')",60000); 	
  window.setInterval("sendRequest1('status1.xml','getStatusXML1')",60000); 
	
</script>

</form>






