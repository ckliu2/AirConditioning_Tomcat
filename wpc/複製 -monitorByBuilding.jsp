<%@ include file="/common/unsecureTaglibs.jsp"%>

<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="scripts/dtree.js"></script>

</head>

<body>


<div class="dtree">

	<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>

	<script type="text/javascript">
		<!--

		d = new dTree('d');

		d.add(0,-1,'<fmt:message key="building.name"/>:<ww:property value="building.name"/>');
				   	
			<ww:set name="room" value="%{getRoomListByBuilding(building)}"/>
	   	<c:set var="roomid" value="1" />
	       <ww:iterator value="%{room}">    
               d.add(<c:out value="${roomid}"/>,0,'<fmt:message key="room.name"/>:<c:out value="${name}"/>');
               
               //Controller
                 <ww:set name="controller" value="%{getControllerByRoom( ${id} )}"/>
               	 	<c:set var="controllerid" value="1" />
               	 <ww:iterator value="%{controller}">
               	        d.add(<c:out value="${roomid}"/><c:out value="${controllerid}"/>,<c:out value="${roomid}"/>,'<fmt:message key="controller.name"/>:<c:out value="${name}"/>');
               	         
               	         //Sensor
               	         <ww:set name="sensor" value="%{getSensorListByController( ${id} )}"/>
               	         <c:set var="sensorid" value="1" />
               	         <ww:iterator value="%{sensor}">               	            
               	             d.add(<c:out value="${roomid}"/><c:out value="${controllerid}"/><c:out value="${sensorid}"/>,<c:out value="${roomid}"/><c:out value="${controllerid}"/>,'<c:out value="${name}"/>','showMonitor.html?id=<c:out value="${id}"/>');
               	            <c:set var="sensorid" value="${sensorid+1}" />
	                       </ww:iterator>
               	         //Sensor
               	         
               	         
                        <c:set var="controllerid" value="${controllerid+1}" />
	               </ww:iterator>
               //Controller
              
	       </ww:iterator>
		document.write(d);

		//-->
	</script>
	
	
	
	
	
	
	
	
	
