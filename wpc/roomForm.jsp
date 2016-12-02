<%@ include file="/common/taglibs.jsp"%>

<ww:form name="roomForm" action="saveRoom" method="POST">
  <ww:hidden name="room.id" value="${room.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="room.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="room.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="room.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    
        <tr><td class="cInputCaption"><fmt:message key="building.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="room.buildingId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="buildingList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('room.buildingId')"/></span>
        </td>
    </tr>
    
    
    <tr><td class="cInputCaption"><fmt:message key="room.name"/></td>
        <td class="cInputColumn">
            <ww:textfield name="room.name" value="%{room.name}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="room.createdDate" /></span>
        </td>
    </tr>


    
   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="room.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="room.createdUser.name"/>
        </td>
    </tr>


    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="room.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="room.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
