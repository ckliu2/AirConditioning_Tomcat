<%@ include file="/common/unsecureTaglibs.jsp"%>



<ww:form name="form1" action="saveReader1.html" method="POST" onsubmit="onSubmit()">
  <ww:hidden name="reader.id" value="${reader.id}"/>
  <ww:hidden name="reader.readerId" value="${reader.readerId}"/>
  <ww:hidden name="reader.name" value="${reader.name}"/>
  
  <ww:hidden name="reader.powerstatus" value="${reader.powerstatus}"/>
  <ww:hidden name="reader.stateId" value="${reader.stateId}"/>
  <ww:hidden name="reader.seqName" value="${reader.seqName}"/>
  <ww:hidden name="reader.information" value="${reader.information}"/>
  
  
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" >設定課表排程冷氣權限</td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
       <input type="button" name="button" id="button" value="儲存" class="cButton" onClick="onSubmit();"/>&nbsp;
       <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;          
      </td>
    </tr>
    
    
   <tr><td class="cInputCaption"><fmt:message key="reader.id"/></td>
        <td class="cInputColumn">
           ${reader.readerId}
        </td>
    </tr>
    
  
    <tr><td class="cInputCaption"><fmt:message key="reader.name"/></td>
        <td class="cInputColumn">
           ${reader.name}
        </td>
    </tr>
    

    <tr><td class="cInputCaption">設定溫度</td>
        <td class="cInputColumn">        
        <ww:select name="reader.temp"                
               list="temperatureList"
               listKey="id"
               listValue="value"
               cssClass="cInputListField"
        />
        </td>
    </tr>


  <tr><td class="cInputCaption">是否開啟</td>
        <td class="cInputColumn">
            <ww:select name="reader.driveId"              
               list="driveList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>


    <tr><td class="cInputCaption">空調模式</td>
        <td class="cInputColumn">
            <ww:select name="reader.modeId"                
               list="modeList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>
    
    
    <tr id="HoneyWell1">
            <td class="cInputCaption">是否鎖定面版</td>
            <td class="cInputColumn">  
              <ww:select name="reader.lockId"                
               list="lockList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
              />            
            </td>
    </tr>  
    
    
    <tr id="HoneyWell2"><td class="cInputCaption">ByPass<br>(不強制變更面版狀態)</td>
        <td class="cInputColumn">
            <ww:checkbox name="reader.pass" cssClass="cCheckboxField" />
        </td>
    </tr>
    
 
    <tr><td class="cInputCaption">風扇速度</td>
        <td class="cInputColumn">
            <ww:select name="reader.fanSpeedId"                
               list="fanSpeedList"
               listKey="id"
               listValue="valueTw"
               cssClass="cInputListField"
            />
        </td>
    </tr>

 
    <tr id="MITSUBISHI1"><td class="cInputCaption">是否准許手動控制開關冷氣</td>
        <td class="cInputColumn">
            <ww:select name="reader.driveItemId"                
               list="driveItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>

    <tr id="MITSUBISHI2"><td class="cInputCaption">是否准許手動控制空調模式</td>
        <td class="cInputColumn">
            <ww:select name="reader.modeItemId"                
               list="modeItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>

    <tr id="MITSUBISHI3"><td class="cInputCaption">是否准許手動控制設定溫度</td>
        <td class="cInputColumn">
            <ww:select name="reader.tempItemId"                
               list="tempItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>

    <tr id="MITSUBISHI4"><td class="cInputCaption">是否准許手動重設濾網</td>
        <td class="cInputColumn">
            <ww:select name="reader.filterItemId"                
               list="filterItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>
    
    
    
    <tr><td class="cInputCaption">是否套用課表排程</td>
        <td class="cInputColumn">
            <ww:checkbox name="reader.active" cssClass="cCheckboxField" />
        </td>
    </tr>
    
   
    <tr><td class="cInputCaption">上述設定套用到其他面版</td>
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
        </td>
    </tr>
    

    
    

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="reader.createdDate" /></span>
        </td>
    </tr>


    <tr class="cActionButtonLine">
      <td colspan="2">
         <input type="button" name="button" id="button" value="儲存" class="cButton" onClick="onSubmit();"/>&nbsp;
         <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;  
      </td>
    </tr>
  </table>
</ww:form>


<script>
 
 function reflash(){
   window.opener.parent.location.reload(); 
   syncReader();
   alert("更新成功!請至事件記錄查看!"); 
   window.close();   
 }

 <%
 String msg=request.getParameter("msg");
  if (msg != null && msg.equals("1")) {
 %>
   reflash();
 <%
 }
 %>
 
 
 function syncReader(){
 	
  $.ajax({
  	async:true,
    url: 'syncReader.html',
    error: function(xhr) {     
    },
    success: function(response) {
    	
    }
  });
	
 }
 
 
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
      title+='至少需要選擇一台面版! \n'; 
   } 
   if(title.length==0){
 	   form1.submit();
   }else{
 	   alert(title);
   }
 }
 
 
 <c:if test="${powerControllerReader.powerController.deviceType=='HoneyWell'}">
  for(i=1;i<=4;i++){   
   	var s = eval('MITSUBISHI'+i) ;
   	s.style.display = "none";
  }  
 </c:if>

 <c:if test="${powerControllerReader.powerController.deviceType=='MITSUBISHI G50'}">
   for(i=1;i<=2;i++){   
   	var s = eval('HoneyWell'+i) ;
   	s.style.display = "none";
  }
 </c:if>

</script>

