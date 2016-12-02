<%@ include file="/common/taglibs.jsp"%>

<ww:form name="sensorForm" action="saveSensor" method="POST">
  <ww:hidden name="sensor.id" value="${sensor.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="sensor.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="sensor.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="sensor.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="building.name"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="sensor.controller.room.building.name" /></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="room.name"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="sensor.controller.room.name" /></span>
        </td>
    </tr>
    
        <tr><td class="cInputCaption"><fmt:message key="controller.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="sensor.controllerId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="controllerList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('sensor.controllerId')"/></span>
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption"><fmt:message key="sensor.name"/></td>
        <td class="cInputColumn">
            <ww:textfield name="sensor.name" value="%{sensor.name}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption"><fmt:message key="deviceProperty.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="sensor.devicePropertyId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="devicePropertyList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('sensor.devicePropertyId')"/></span>
        </td>
    </tr>
    
    
     <tr><td class="cInputCaption"><fmt:message key="myDVR.name"/></td>
        <td class="cInputColumn">
            <ww:select name="sensor.mydvrId" onchange="chooseDVR(this)" id="mydvr"
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="myDVRList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            />
        </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="myDVR.channel"/></td>
        <td class="cInputColumn">
            <ww:textfield name="sensor.channel" value="%{sensor.channel}" cssClass="cInputTextFieldTiny" id="channel"/><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('sensor.channel')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="sensor.createdDate" /></span>
        </td>
    </tr>


    
   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="sensor.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="sensor.createdUser.name"/>
        </td>
    </tr>





    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="sensor.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="sensor.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>

<script>
 function chooseDVR(){ 	
  	var x=sensorForm.mydvr.value;  	
      if(x==""){
   	    //alert("chooseDVR null");
   	    sensorForm.channel.value="";
      }
} 
</script>
