<%@ include file="/common/taglibs.jsp"%>

<ww:form name="shutdownForm" action="saveShutdown" method="POST">
  <ww:hidden name="shutdown.id" value="${shutdown.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="shutdown.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="shutdown.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="shutdown.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="shutdown.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="shutdown.name" value="%{shutdown.name}" maxlength="30" cssClass="cInputTextFieldShort" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('shutdown.name')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="shutdown.percent"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="shutdown.perc" value="%{shutdown.perc}" cssClass="cInputTextFieldTiny" />
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('shutdown.perc')"/></span>
        </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="shutdown.gap"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="shutdown.gap" value="%{shutdown.gap}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('shutdown.gap')"/></span>
        </td>
    </tr>


    <tr><td class="cInputCaption"><fmt:message key="shutdown.evenlevel"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="shutdown.evenlevelId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="evenlevelList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('shutdown.evenlevelId')"/></span>
        </td>
    </tr>


    <tr><td class="cInputCaption"><fmt:message key="shutdown.reader"/></td>
        <td class="cInputColumn">
            <ww:checkboxlist name="readerIds" 
               list="readerList"
               listKey="id"
               listValue="caption_"
               value = "%{readerIds}"
            />
        </td>
    </tr>
 
 
     <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="shutdown.createdUser" /></span>
        </td>
    </tr>   
    
    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="shutdown.createdDate" /></span>
        </td>
    </tr>

    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="shutdown.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="shutdown.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
