<%@ include file="/common/taglibs.jsp"%>

<ww:form name="evenLevelForm" action="saveEvenLevel" method="POST">
  <ww:hidden name="evenLevel.id" value="${evenLevel.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="evenLevel.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="evenLevel.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="evenLevel.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="evenLevel.name"/></td>
        <td class="cInputColumn">
            <ww:textfield name="evenLevel.name" value="%{evenLevel.name}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="evenLevel.shortMessage"/></td>
        <td class="cInputColumn">
            <ww:textfield name="evenLevel.shortMessage" value="%{evenLevel.shortMessage}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="evenLevel.longMessage"/></td>
        <td class="cInputColumn">
            <ww:textarea name="evenLevel.longMessage" value="%{evenLevel.longMessage}" cssClass="cInputTextArea" cols="45" rows="12" />
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="evenLevel.memo"/></td>
        <td class="cInputColumn">
            <ww:textfield name="evenLevel.memo" value="%{evenLevel.memo}" maxlength="100" cssClass="cInputTextFieldLong" />
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="evenLevel.createdDate" /></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="evenLevel.member"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="evenLevel.memberId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="memberList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('evenLevel.memberId')"/></span>
        </td>
    </tr>


    <tr><td class="cInputCaption"><fmt:message key="evenLevel.messenger"/></td>
        <td class="cInputColumn">
            <ww:select name="evenLevel.messengerId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="messengerList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />
        </td>
    </tr>

    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="evenLevel.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="evenLevel.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
