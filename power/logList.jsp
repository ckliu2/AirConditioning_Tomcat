<%@ include file="/common/taglibs.jsp"%>

 

<STYLE type="text/css">
        a
        {
            color: #007bc4 /*#424242*/;
            text-decoration: none;
        }
        a:hover
        {
            text-decoration: underline;
        }
        ol, ul
        {
            list-style: none;
        }
        body
        {
            height: 100%;
            font: 12px/18px Tahoma, Helvetica, Arial, Verdana, "\5b8b\4f53" , sans-serif;
            color: #51555C;
        }
        img
        {
            border: none;
        }
        .demo
        {
            width: 500px;
            margin: 20px auto;
        }
        .demo h4
        {
            height: 32px;
            line-height: 32px;
            font-size: 14px;
        }
        .demo h4 span
        {
            font-weight: 500;
            font-size: 12px;
        }
        .demo p
        {
            line-height: 28px;
        }
        
        
        .ui-timepicker-div .ui-widget-header
        {
            margin-bottom: 8px;
        }
        .ui-timepicker-div dl
        {
            text-align: left;
        }
        .ui-timepicker-div dl dt
        {
            height: 25px;
            margin-bottom: -25px;
        }
        .ui-timepicker-div dl dd
        {
            margin: 0 10px 10px 65px;
        }
        .ui-timepicker-div td
        {
            font-size: 90%;
        }
        .ui-tpicker-grid-label
        {
            background: none;
            border: none;
            margin: 0;
            padding: 0;
        }
        .ui_tpicker_hour_label, .ui_tpicker_minute_label, .ui_tpicker_second_label, .ui_tpicker_millisec_label, .ui_tpicker_time_label
        {
            padding-left: 20px;
        }
    </STYLE>

<SCRIPT type="text/javascript">
        $(function () {
        	   var opt={
             dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
             dayNamesMin:["日","一","二","三","四","五","六"],
             monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
             monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
             prevText:"上月",
             nextText:"次月",
             weekHeader:"週",
             showMonthAfterYear:true,
             dateFormat:"yy-mm-dd"
            }; 
            var startDate = $('#startDate');
            startDate.datetimepicker(opt); 
            var endDate = $('#endDate');
            endDate.datetimepicker(opt);           
        });
</SCRIPT>

    
    
<form name="form1" method="post" action="logList.html">

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" >事件記錄</td>
      </tr>
      <tr class="cActionButtonLine">
        <td>

          輸入事件起始時間 : <input type="text" name="startDate" id="startDate" title="輸入事件起始時間"  value="${startDate}" class="cInputTextFieldShort" readonly="true" maxlength="16"/>     
           ~
          輸入事件結束時間 : <input type="text" name="endDate" id="endDate" title="輸入事件結束時間"  value="${endDate}" class="cInputTextFieldShort" readonly="true" maxlength="16"/>     
          
          
          <ww:select name="typeId"   
               headerKey=""
               headerValue="%{getText('請選擇事件種類')}....."             
               list="logMode"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
               /> 
          <br>
          輸入事件內容關鍵字 : 
          <input type="text" name="msg" id="msg" title="輸入事件內容關鍵字"  value="${msg}" class="cInputTextFieldShort"/>     
           	   
          <br>
          <input type="submit" value="查詢"/>

        </td>
      </tr>
      <tr>
        <td>

<c:set var="i" value="0" />
<c:set var="count" value="1" />

<ww:set name="ls" value="%{getLogList()}"/> 

<display:table name="ls" class="list" cellspacing="1" requestURI="logList.html" id="row"  pagesize="50" sort="list" partialList="true" size="${RESULT_SIZE}">   
   
    <display:column property="id" sortable="true" title="事件編號" style="text-align:left" />
    <display:column property="reader.name" sortable="true" title="冷氣面版" style="text-align:left" />
    <display:column title="排程"  style="text-align:left">    	  
    	  <ww:if test="${row.scheduleDaily.id != null}">
          排程編號: ${row.scheduleDaily.id}<br>    
          排程時間: ${row.scheduleDaily.scheduledDate}<br>
          設定溫度:${row.scheduleDaily.temp} ℃<br>	
          是否開啟:${row.scheduleDaily.drive}<br>	          
				  模式:${row.scheduleDaily.mode} <br>					         
				  是否准許手動控制開關冷氣:${row.scheduleDaily.driveItem}  <br>
				  是否准許手動控制空調模式:${row.scheduleDaily.modeItem}  <br>
				  是否准許手動控制設定溫度:${row.scheduleDaily.tempItem}  <br>
				  是否准許手動重設濾網:${row.scheduleDaily.filterItem}  <br>				  
				  最後更新時間:${row.scheduleDaily.lastModifiedDate}  <br>
				  最後修改人:${row.scheduleDaily.lastModifiedUser.name}  <br>
				  IP:${row.scheduleDaily.ip}  <br>
				  是否已下放至面版:${row.scheduleDaily.active}  <br>
				</ww:if>  				
    </display:column>    
    <display:column property="createdDate" sortable="true" title="事件時間" style="text-align:left" decorator="com.base.web.displaytag.DateformatDecorator1"/>
    <display:column property="type.caption_" sortable="true" title="事件種類" style="text-align:left"/>
    <display:column title="事件內容"  sortable="true"  style="text-align:center">      
    	<a id="jttrigger-${i}"><img src="images/GridView.gif" height="16" border="0"/></a>    	
			<div id="jttip-${i}" class="jttip" style="display:none;">
			 <div class="jttipcontent">
				${row.msg}			        
			 </div>
		  </div>
		  <c:set var="i" value="${i+1}" />	    
    </display:column>    
    <display:column property="createdUser.name" sortable="true" title="觸發人員" style="text-align:left" />
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


      



