<%@ include file="/common/taglibs.jsp"%>

<ww:form name="controllerForm" action="saveController" method="POST">
  <ww:hidden name="controller.id" value="${controller.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="controller.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="controller.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="controller.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="controller.name"/></td>
        <td class="cInputColumn">
            <ww:textfield name="controller.name" value="%{controller.name}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="controller.ip"/></td>
        <td class="cInputColumn">
            <ww:textfield name="controller.ip" value="%{controller.ip}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>





    <tr><td class="cInputCaption"><fmt:message key="room.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="controller.roomId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="roomList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('controller.roomId')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="controller.createdDate" /></span>
        </td>
    </tr>


    
   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="controller.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="controller.createdUser.name"/>
        </td>
    </tr>
    
    
    


    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="controller.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="controller.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
