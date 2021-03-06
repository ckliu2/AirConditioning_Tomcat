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
${reader.name} 每周排程
</div>	


<STYLE type="text/css">
        body {
            font-size: 10pt;
            font-family: verdana, sans, arial, sans-serif;
        }
</STYLE>
     
<SCRIPT src="${ctx}/scripts/timeline.js" type="text/javascript"></SCRIPT>
<LINK href="${ctx}/css/timeline.css" rel="stylesheet" type="text/css">  

<DIV id="mytimeline"/>

<SCRIPT type="text/javascript">
        var timeline;
        var data;

        // Called when the Visualization API is loaded.
        function drawVisualization() {
            // Create a JSON data table
            
     
           data = [
           
              <ww:set name="ls" value="%{getDeviceWeekly()}"/>  
              <c:set var="count" value="0" /> 
              <c:set var="quote" value="," /> 
              <ww:iterator value="ls">           
                <ww:if test="${fn:length(ls)}-1 == ${count}">
                 <c:set var="quote" value="" /> 
                </ww:if>
                      {                           	      	
                        'start': new Date(${calendar.time.year+1900},${calendar.time.month},${calendar.time.date},${hour},${minute},0),
                        'content': '${dailyMSG}' 
                      }
                      ${quote}
                 <c:set var="count" value="${count+1}" />
              </ww:iterator>    
                
            ];
     
            // specify options
            var options = {
                'width':  '100%',
                'height': '550px',
                'editable': false,   // enable dragging and editing events                
                'style': 'box'
            };
            
            // Instantiate our timeline object.
            timeline = new links.Timeline(document.getElementById('mytimeline'));
            timeline.draw(data, options);
            
        }
        
       drawVisualization();
    </SCRIPT>
    
    



