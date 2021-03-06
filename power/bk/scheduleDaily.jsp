<%@ include file="/common/unsecureTaglibs.jsp"%>
<LINK href="${ctx}/css/jquery-ui.css" rel="stylesheet" type="text/css">  
<link href="<ww:url value="/webwork/jscalendar/calendar-blue.css" />" rel="stylesheet" type="text/css" media="all"/>
  

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
<SCRIPT src="${ctx}/scripts/common.js" type="text/javascript"></SCRIPT>     
<SCRIPT src="${ctx}/scripts/list.js" type="text/javascript"></SCRIPT>    
<SCRIPT src="${ctx}/scripts/jquery-ui.js" type="text/javascript"></SCRIPT>     
<SCRIPT src="${ctx}/scripts/jquery-ui-slide.min.js" type="text/javascript"></SCRIPT>     
<SCRIPT src="${ctx}/scripts/jquery-ui-timepicker-addon.js" type="text/javascript"></SCRIPT>
    
<SCRIPT type="text/javascript">
        $(function () {       	    
        	  //$.datepicker.setDefaults( $.datepicker.regional[ "zh-tw" ] );        	     	 
            var scheduledDate = $('#scheduledDate');
            scheduledDate.datetimepicker();            
        });
    </SCRIPT>
 
<ww:form name="form1" action="saveScheduleDaily.html" method="POST">
<ww:hidden name="scheduleDaily.id" value="${scheduleDaily.id}"/>
<ww:hidden name="reader.id" value="${reader.id}"/>
<table width="100%" border="0">
  <tr><td class="cContentTitle" colspan="2" >手動排程(時間)</td></tr>
  <tr>
    <td width="50%" align="left" valign="top">
    
    <table width="100%" border="1" class="cContentTable">
    
      <tr>
        <td class="cInputCaption">排程編號</td>
        <td class="cInputColumn">${scheduleDaily.id}</td>
      </tr>
      
      <tr>
        <td class="cInputCaption">時間設定</td>
        <td class="cInputColumn">       
         <ww:textfield name="scheduledDate" id="scheduledDate" value="%{scheduledDate}" cssClass="cInputTextField" />            
        </td>
      </tr>
      
      <tr>
        <td class="cInputCaption">參數設定</td>
        <td><table width="100%" border="0">
          <tr>
            <td class="cInputColumn">設定溫度</td>
            <td>
            
            <ww:select name="scheduleDaily.temp"                
               list="temperatureList"
               listKey="id"
               listValue="value"
               cssClass="cInputListField"
            />
 
            </td>
          </tr>
          <tr>
            <td class="cInputColumn">是否開啟</td>
            <td>
              <ww:select name="scheduleDaily.driveId"              
               list="driveList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />            
            </td>
          </tr>
          
          <tr>
            <td class="cInputColumn">空調模式</td>
            <td>
              <ww:select name="scheduleDaily.modeId"                
               list="modeList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
              />            
             </td>
          </tr>      
    
          <tr>
            <td class="cInputColumn">是否准許手動控制開關冷氣</td>
            <td>  
              <ww:select name="scheduleDaily.driveItemId"                
               list="driveItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
              />            
            </td>
          </tr>
          <tr>
            <td class="cInputColumn">是否准許手動控制空調模式</td>
            <td>
               <ww:select name="scheduleDaily.modeItemId"                
               list="modeItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
              />            
            </td>
          </tr>
          <tr>
            <td class="cInputColumn">是否准許手動控制設定溫度</td>
            <td>  
               <ww:select name="scheduleDaily.tempItemId"                
               list="tempItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
              />            
            </td>
          </tr>
          <tr>
            <td class="cInputColumn">是否准許手動重設濾網</td>
            <td>
               <ww:select name="scheduleDaily.filterItemId"                
               list="filterItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
               />            
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td class="cInputCaption">上述設定套用到其他卡機</td>
        <td class="cInputColumn">
         
          <table>
          
            <tr>
             <td>
             
                <ww:select name="spaceId"  id="spaceId" onchange="javascript:selectspace()"
                 headerKey=""
                 headerValue="%{getText('請選擇管制區域')}....."
                 list="spaceListAir"
                 listKey="id"
                 listValue="name"
                 cssClass="cInputListField"
                />  
                         
             </td>
            </tr>
            
            
            <tr>
                <th align="center"><span style="font-size:10pt">可選擇的卡機</style></th>
                <th>&nbsp</th>
                <th align="center"><span style="font-size:10pt">已選擇的卡機</style></th>
            </tr><tr>
            <td>               
                <ww:select id="allReaders" 
                list="readerListBySpace"
                listKey="reader.id"
                listValue="'名稱:'+reader.name+'-編號:'+reader.readerId"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                />                          
                </td><td>
                <input type="button" value=">>" class="cSelectButton" onclick="moveAll(allReaders, selectedReader);"><br>
                <input type="button" value=">"  class="cSelectButton" onclick="moveOne(allReaders, selectedReader);"><br>
                <input type="button" value="<"  class="cSelectButton" onclick="moveOne(selectedReader, allReaders);"><br>
                <input type="button" value="<<" class="cSelectButton" onclick="moveAll(selectedReader, allReaders);"><br>
            </td><td align="center"> 
                <ww:select name="selectedReaderIds" id="selectedReader"
                list="selectedReaderList"
                listKey="id"
                listValue="'名稱:'+name+'-編號:'+readerId"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                />  
                          
            </td>
            </tr>
            </table>        
         </td>
      </tr>
      <tr>
        <td colspan="2" >
        <div align="center">
          <input type="button" name="button" id="button" value="儲存" class="cButton" onClick="onSubmit();"/>
          <ww:if test="scheduleDaily.id != null">
          <input type="submit" name="delete1"  value="刪除" class="cButton" onClick="javascript:return confirm('確定要刪除排程編號${scheduleDaily.id}?')"  />
          </ww:if>
        </div>        
        </td>
        </tr>
    </table></td>
    <td width="50%" align="left" valign="top">
    
    <table width="100%" border="1" class="cContentTable">
      <tr>
        <td>
        
        <table width="100%" border="0">
        
          <tr>
            <td colspan="3" class="cInputColumn"  align="center"><ww:datepicker cssClass="cInputTextFieldShort" name="beginDate" id="beginDate" value="%{beginDate}" language="zh" format="%Y-%m-%d" readonly="true" onchange="query();"/>        </td>
          </tr>
          
          <tr>
            <td colspan="3" class="cInputColumn"  align="left"><a href="scheduleDaily.html?reader.id=${reader.id}"><img src="${ctx}/images/add.png" border="0"/>新增排程</a></td>
          </tr>
          
          <tr>
            <td class="cInputColumn">
            
              <c:set var="count" value="0" />
              
              <ww:set name="ls" value="%{getScheduleDailyByReader()}"/>  
              
             
              <display:table name="ls" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
                <display:column title="No" sortable="true">
                  ${count+1}
                </display:column>
                <display:column property="scheduleDaily.id" sortable="true" title="排程編號" style="text-align:left" />
                <display:column property="scheduledDate" sortable="true" title="時間" style="text-align:left" decorator="com.base.web.displaytag.DateformatDecorator"/>
                <display:column title="開關" sortable="true">
                  ${row.scheduleDaily.drive}
                </display:column>
                <display:column title="溫度" sortable="true">
                  ${row.scheduleDaily.temp} ℃
                </display:column>
                <display:column title="模式" sortable="true">
                  ${row.scheduleDaily.mode}
                </display:column>
                <display:column title="權限" sortable="true">
                
                   <a id="jttrigger-${count}"><img src="${ctx}/images/GridView.gif" border="0" id="c-${count}"/></a>
			             <div id="jttip-${count}" class="jttip" style="display:none;">
				           <div class="jttipcontent">
				            排程編號:${row.scheduleDaily.id} <br>
				            設定溫度:${row.scheduleDaily.temp} ℃<br>	
				            模式:${row.scheduleDaily.mode} <br>					         
				            是否准許手動控制開關冷氣:${row.scheduleDaily.driveItem}  <br>
				            是否准許手動控制空調模式:${row.scheduleDaily.modeItem}  <br>
				            是否准許手動控制設定溫度:${row.scheduleDaily.tempItem}  <br>
				            是否准許手動重設濾網:${row.scheduleDaily.filterItem}  <br> 
					         </div>
		              </div> 
                  
                </display:column>
                
                <c:set var="count" value="${count+1}" />
                
                <display:column title="卡機" sortable="true">
                    <a id="jttrigger-${count}"><img src="${ctx}/images/GridView.gif" border="0" id="c-${count}"/></a>
			              <div id="jttip-${count}" class="jttip" style="display:none;">
				            <div class="jttipcontent">	
				               <c:forEach var="reader" items="${row.scheduleDaily.readers}">  
				                 名稱:${reader.name}-編號:${reader.readerId}<br>
				               </c:forEach>            
				             </div>
		              </div> 
				           
				           
                </display:column>
                
                
                <display:column title="執行" sortable="true">                
                    <ww:if test="${row.active == true}">
                       <font color="blue">已執行</font>
                    </ww:if>
                    <ww:else>
                       <font color="red">未執行</font>
                    </ww:else>
                </display:column>
                
                <display:column title="編輯" sortable="true">                   
                     <a href="scheduleDaily.html?reader.id=${reader.id}&scheduleDaily.id=${row.scheduleDaily.id}">
                        <img src="${ctx}/images/GridEdit.gif"/>
                      </a>
                </display:column>
                
                <c:set var="count" value="${count+1}" />
              </display:table>
              

            </td>        
          </tr>
        
        </table>
        
        </td>
        </tr>
    </table></td>
  </tr>
</table>

</ww:form>

<script>
 
 function selectspace(){
 	var spaceId= $("#spaceId").val(); 
 	var urls='readerByJSON.html?space.id='+spaceId+"&scheduleDaily.id=${scheduleDaily.id}";
	$.getJSON(urls,function( data ) {  
    $.each( data,function( key, val ) {       
     $("#allReaders").append($("<option></option>").attr("value", val.id ).text( val.name )); 
    });
  });	
  
}
 
 function onSubmit() {
   mySelectAll(document.form1.selectedReader);
   var theSel=document.getElementById("selectedReader"); 
   var theSelLen=theSel.length;  
   var title='';
   if($("#scheduledDate").val()==''){
    	 title+='「日期選擇」為必填欄位! \n';    	
   }   
   if(theSelLen==0){
      title+='至少需要選擇一台卡機! \n'; 
   } 
   if(title.length==0){
 	   form1.submit();
   }else{
 	   alert(title);
   }
 }
 
 <%
 String msg=request.getParameter("msg"); 
  if (msg != null && msg.equals("1")) {
 %>
   alert("更新成功!");
   window.close();
 <%
 }
 %>
 
 
 function query(){
 	 var beginDate=document.all.beginDate.value;
 	 var page='scheduleDaily.html?reader.id=${reader.id}&beginDate='+beginDate;
 	 //alert(page);
 	 window.location=page;
 }
  
</script>

<script>
jQuery(function($){ 
     $.datepicker.regional['zh-CN'] = { 
        clearText: '清除', 
        clearStatus: '清除已选日期', 
        closeText: '关闭', 
        closeStatus: '不改变当前选择', 
        prevText: '<上月', 
        prevStatus: '显示上月', 
        prevBigText: '<<', 
        prevBigStatus: '显示上一年', 
        nextText: '下月>', 
        nextStatus: '显示下月', 
        nextBigText: '>>', 
        nextBigStatus: '显示下一年', 
        currentText: '今天', 
        currentStatus: '显示本月', 
        monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
        monthNamesShort: ['一','二','三','四','五','六', '七','八','九','十','十一','十二'], 
        monthStatus: '选择月份', 
        yearStatus: '选择年份', 
        weekHeader: '周', 
        weekStatus: '年内周次', 
        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'], 
        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'], 
        dayNamesMin: ['日','一','二','三','四','五','六'], 
        dayStatus: '设置 DD 为一周起始', 
        dateStatus: '选择 m月 d日, DD', 
        dateFormat: 'yy-mm-dd', 
        firstDay: 1, 
        initStatus: '请选择日期', 
        isRTL: false}; 
        $.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
    });

</script>




