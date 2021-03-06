<%@ include file="/common/taglibs.jsp"%>

<ww:form name="basicInfoForm" action="saveBasicInfo" method="POST" onsubmit="onSubmit()">
  <ww:hidden name="basicInfo.id" value="${basicInfo.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="basicInfo.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;

        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="basicInfo.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    
    <tr><td class="cInputCaption">本學年<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.year" value="%{basicInfo.year}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.year')"/></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption">本學期<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.sem" value="%{basicInfo.sem}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.sem')"/></span>
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption">學年期起迄<span class="cRequired">*</span></td>
        <td class="cInputColumn">
         <input name="scheduleStart" value="${scheduleStart}" id="scheduleStart" type="text" Class="cInputTextFieldTiny" class="hasDatepicker" readonly="true" />
         ~
         <input name="scheduleEnd" value="${scheduleEnd}" id="scheduleEnd" type="text" Class="cInputTextFieldTiny" class="hasDatepicker" readonly="true" />
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption">外部資料同步臨界值<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.threshold" value="%{basicInfo.threshold}" cssClass="cInputTextFieldTiny" />
            (%)
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.threshold')"/></span>
            (少於臨界值就不會執行同步)
        </td>
    </tr>
    
     <tr><td class="cInputCaption">提前啟動冷氣(分)<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.onMinutes" value="%{basicInfo.onMinutes}" cssClass="cInputTextFieldTiny" />
            (分鐘)
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.onMinutes')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption">延後關閉冷氣(分)<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.offMinutes" value="%{basicInfo.offMinutes}" cssClass="cInputTextFieldTiny" />
            (分鐘)
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.offMinutes')"/></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption">每隔N分鐘校時1次<br>(1天=1440分鐘)<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.timingEveryMins" value="%{basicInfo.timingEveryMins}" cssClass="cInputTextFieldTiny" />
            (分鐘)
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.timingEveryMins')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption">每隔N分鐘同步課表1次<br>(1天=1440分鐘)<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.weeklyEveryMins" value="%{basicInfo.weeklyEveryMins}" cssClass="cInputTextFieldTiny" />
            (分鐘)
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.weeklyEveryMins')"/></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption">面版無更新時重新啟動程式並通知管理者<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="basicInfo.panelUpdateMins"              
               list="panelUpdateMinsList"              
               cssClass="cInputListField"
            />
            (分鐘)
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption">停止排程檢查時重新啟動程式並通知管理者<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="basicInfo.scheduleCheckMins"              
               list="scheduleCheckMinsList"              
               cssClass="cInputListField"
            />
            (分鐘)
        </td>
    </tr>
    
    
    
    <tr><td class="cInputCaption">溫度上限<br>(如果User溫度調整過低會強制修正)<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="basicInfo.templimit"              
               list="temperatureList"
               listKey="id"
               listValue="value"
               cssClass="cInputListField"
            />         
        </td>
    </tr>
  
    
    
    
    
    
    <tr><td class="cInputCaption">每日強制初始化時段<span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="basicInfo.initializeTime" id="initializeTime" value="%{basicInfo.initializeTime}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.initializeTime')"/></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption">每日強制關閉冷氣時間<br>(含以後)</td>
        <td class="cInputColumn">
          <hr>   
             
             <table width="100%" border="0">
  <tr>
    <td><div align="left">
     時間設定 <ww:textfield name="basicInfo.shutdownTime" id="shutdownTime" value="%{basicInfo.shutdownTime}" cssClass="cInputTextFieldTiny" readonly="true"/>
     <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('basicInfo.shutdownTime')"/></span>

    </div></td>
   
  </tr>
  <tr>
    <td colspan="2">
    <div align="left">
     
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
                <th align="center"><span style="font-size:10pt">可選擇的面版</style></th>
                <th>&nbsp</th>
                <th align="center"><span style="font-size:10pt">已選擇的面版</style></th>
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
     
     
    </div></td>
  </tr>
</table>
             
             
             
             
             
             
             
        </td>
    </tr>
    

    
    
    <tr>
        <td class="cInputCaption">
        上述設定套用到其他面版        
        </td>
        <td class="cInputColumn">         
        
         </td>
      </tr>

    <tr class="cActionButtonLine">
      <td colspan="2">
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;

        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;

        </ww:else>
      </td>
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


	$("#initializeTime").timePicker({step: 15});
	$("#shutdownTime").timePicker({step: 15});
	
	
	var opt={
             dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
             dayNamesMin:["日","一","二","三","四","五","六"],
             monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
             monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
             prevText:"上月",
             nextText:"次月",
             weekHeader:"週",
             showMonthAfterYear:true,
             changeMonth: true,
			       changeYear: true,
			       dateFormat:"yy/mm/dd"
            };
	var scheduleStart = $('#scheduleStart');
  scheduleStart.datepicker(opt);   
  
  var scheduleEnd = $('#scheduleEnd');
  scheduleEnd.datepicker(opt);   
  

function onSubmit() {
   mySelectAll(document.basicInfoForm.selectedReader);
   return true;  
 }

</script>



