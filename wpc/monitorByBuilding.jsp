<%@ include file="/common/unsecureTaglibs.jsp"%>

<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="scripts/dtree.js"></script>


<ww:set name="monitors" value="%{getMonitors()}"/>

<SCRIPT LANGUAGE="VBScript">
<!--
Sub window_onLoad()


<ww:iterator value="monitors">
   frm1.ChtIEx<ww:property value="id"/>.IpAddr = "<ww:property value="mydvr.ip"/>"
   frm1.ChtIEx<ww:property value="id"/>.UserName = "<ww:property value="mydvr.userId"/>"
   frm1.ChtIEx<ww:property value="id"/>.Password = "<ww:property value="mydvr.password"/>"
   frm1.ChtIEx<ww:property value="id"/>.PortNum = <ww:property value="mydvr.port"/>
   frm1.ChtIEx<ww:property value="id"/>.ChNum = <ww:property value="channel"/>
   frm1.ChtIEx<ww:property value="id"/>.Connect()
</ww:iterator>

end sub
-->
</SCRIPT>


<form id="frm1">
	<table width="100%" border="0">
      <tr>
        <td width="10%" height="194" align="left" valign="top" id=frmTitle >
        
        	<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>
        <!--Menu-->
        <div class="dtree">
             <script type="text/javascript">
		<!--

		d = new dTree('d');

		d.add(0,-1,'<fmt:message key="building.name"/>:<ww:property value="building.name"/>');
				   	
			<ww:set name="room" value="%{getRoomListByBuilding(building)}"/>
	   	<c:set var="roomid" value="1" />
	       <ww:iterator value="%{room}">    
               d.add(<c:out value="${roomid}"/>,0,'<fmt:message key="room.name"/>:<c:out value="${name}"/>','monitorByBuilding.html?id=<c:out value="${building.id}"/>&buildingId=<c:out value="${building.id}"/>');
               
               //Controller
                 <ww:set name="controller" value="%{getControllerByRoom( ${id} )}"/>
               	 	<c:set var="controllerid" value="1" />
               	 <ww:iterator value="%{controller}">
               	        d.add(<c:out value="${roomid}"/><c:out value="${controllerid}"/>,<c:out value="${roomid}"/>,'<fmt:message key="controller.name"/>:<c:out value="${name}"/>','monitorByBuilding.html?id=<c:out value="${building.id}"/>&controllerId=<c:out value="${id}"/>');
               	         
               	         //Sensor
               	         <ww:set name="sensor" value="%{getSensorListByController( ${id} )}"/>
               	         <c:set var="sensorid" value="1" />
               	         <ww:iterator value="%{sensor}">               	            
               	             d.add(<c:out value="${roomid}"/><c:out value="${controllerid}"/><c:out value="${sensorid}"/>,<c:out value="${roomid}"/><c:out value="${controllerid}"/>,'<c:out value="${name}"/>','monitorByBuilding.html?id=<c:out value="${building.id}"/>&sensorId=<c:out value="${id}"/>');
               	            <c:set var="sensorid" value="${sensorid+1}" />
	                       </ww:iterator>
               	         //Sensor
               	         
               	         
                        <c:set var="controllerid" value="${controllerid+1}" />
	               </ww:iterator>
               //Controller
              
	       </ww:iterator>
		document.write(d);


       d.openAll();
		//-->
	 </script>
        
        <!--Menu-->
        
        
        
        &nbsp;</td>
        <td width="1%" height="768" bgcolor="#6C85E8"  onclick=switchSysBar() >
          <font style=COLOR:BLACK;CURSOR:hand;FONT-FAMILY:Webdings;FONT-SIZE:8pt><SPAN id=switchPoint>3</SPAN></font>
        
        </td>
        <td align="left" valign="top"><table width="100%" border="0" align="left">
          <tr>
            <td>
            
          <!--  Show Monitor-->  
          <c:set var="monitorid" value="1" />
          
          
          <ww:iterator value="%{monitors}">  
            <table width="320" border="1">
              <tr>
                <td>
               <span class="dtree">
               <c:out value="${channel}"/>- No:<c:out value="${monitorid}"/>:<br><c:out value="${controller.room.building.name}"/>/<c:out value="${controller.room.name}"/>/<c:out value="${controller.name}"/>/<c:out value="${name}"/>
                </span>
                </td>
              </tr>
              <tr>
                <td>                 
           <OBJECT ID="ChtIEx<c:out value="${id}"/>" WIDTH=500 HEIGHT=340 VSPACE=3 HSPACE=3
              CLASSID="CLSID:D67DB088-70B4-4006-B052-57F614FD3AA8"
              CODEBASE="http://www.vguard.net/myasp/chtIEx.cab#Version=1,0,0,12">
              <PARAM NAME="_Version" VALUE="65536">
              <PARAM NAME="_ExtentX" VALUE="12933">
              <PARAM NAME="_ExtentY" VALUE="8567">
              <PARAM NAME="_StockProps" VALUE="0">
            </OBJECT>    
                

                
                </td>
              </tr>
              <tr>
                <td>
                 <span class="dtree">
                Status:
                 </span>
                </td>
              </tr>
            </table>
            <c:set var="monitorid" value="${monitorid+1}" />
            </ww:iterator>
            
            </td>
          </tr>
        </table>
        
      <!--  Show Monitor-->    
        
        
        
        
        </td>
      </tr>
    </table>
	<p>&nbsp; </p>
 </form>   
    
 <script>
 function switchSysBar(){
if (switchPoint.innerText==3){
switchPoint.innerText=4
document.all("frmTitle").style.display="none"

}else{
switchPoint.innerText=3
document.all("frmTitle").style.display=""
}}
 </script>   
 
 

