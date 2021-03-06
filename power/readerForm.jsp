<%@ include file="/common/taglibs.jsp"%>

<ww:form name="readerForm" action="saveReader" method="POST">
  <ww:hidden name="reader.id" value="${reader.id}"/>
  
  <ww:hidden name="reader.powerstatus" value="${reader.powerstatus}"/>
  <ww:hidden name="reader.stateId" value="${reader.stateId}"/>
  <ww:hidden name="reader.information" value="${reader.information}"/>
  
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="reader.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="reader.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="reader.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    
    
   <tr><td class="cInputCaption"><fmt:message key="reader.id"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="reader.readerId" value="%{reader.readerId}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('reader.readerId')"/></span>
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption"><fmt:message key="reader.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="reader.name" value="%{reader.name}" maxlength="30" cssClass="cInputTextFieldShort" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('reader.name')"/></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="reader.seqName"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="reader.seqName" value="%{reader.seqName}" maxlength="30" cssClass="cInputTextFieldShort" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('reader.seqName')"/></span>
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
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="driveListInit"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>


    <tr><td class="cInputCaption">空調模式</td>
        <td class="cInputColumn">
            <ww:select name="reader.modeId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="modeListInit"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>
    

    <tr><td class="cInputCaption">是否准許手動控制開關冷氣</td>
        <td class="cInputColumn">
            <ww:select name="reader.driveItemId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="driveItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>
 
    <tr><td class="cInputCaption">是否准許手動控制空調模式</td>
        <td class="cInputColumn">
            <ww:select name="reader.modeItemId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="modeItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>

    <tr><td class="cInputCaption">是否准許手動控制設定溫度</td>
        <td class="cInputColumn">
            <ww:select name="reader.tempItemId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="tempItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>

    <tr><td class="cInputCaption">是否准許手動重設濾網</td>
        <td class="cInputColumn">
            <ww:select name="reader.filterItemId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="filterItemList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption">是否啟用</td>
        <td class="cInputColumn">
            <ww:checkbox name="reader.active" cssClass="cCheckboxField" />
        </td>
    </tr>
    
  
    
    

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="reader.createdDate" /></span>
        </td>
    </tr>


    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="reader.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="reader.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
