<%@ include file="/common/taglibs.jsp"%>

<ww:form name="myDVRForm" action="saveMyDVR" method="POST">
  <ww:hidden name="myDVR.id" value="${myDVR.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="myDVR.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="myDVR.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="myDVR.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="myDVR.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="myDVR.name" value="%{myDVR.name}" maxlength="30" cssClass="cInputTextFieldLong" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('myDVR.name')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="myDVR.ip"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="myDVR.ip" value="%{myDVR.ip}" maxlength="30" cssClass="cInputTextFieldShort" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('myDVR.ip')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="myDVR.userId"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="myDVR.userId" value="%{myDVR.userId}" maxlength="30" cssClass="cInputTextFieldShort" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('myDVR.userId')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="myDVR.password"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="myDVR.password" value="%{myDVR.password}" maxlength="30" cssClass="cInputTextFieldShort" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('myDVR.password')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="myDVR.port"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="myDVR.port" value="%{myDVR.port}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('myDVR.port')"/></span>
        </td>
    </tr>
    

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="myDVR.createdDate" /></span>
        </td>
    </tr>


    
   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="myDVR.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="myDVR.createdUser.name"/>
        </td>
    </tr>




    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="myDVR.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="myDVR.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
