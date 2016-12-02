<%@ include file="/common/taglibs.jsp"%>

<ww:form name="recorderForm" action="saveRecorder" method="POST">
  <ww:hidden name="recorder.id" value="${recorder.id}"/>
  <ww:hidden name="recorder.memberId" value="${member.id}"/>

  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="recorder.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="recorder.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="recorder.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    
    
  <tr><td class="cInputCaption"><fmt:message key="recorder.member"/></td>
        <td class="cInputColumn">
             <ww:property value="member.name"/>
        </td>
    </tr>
    
    
    
    <tr><td class="cInputCaption"><fmt:message key="recorder.money"/></td>
        <td class="cInputColumn">
            <ww:textfield name="recorder.money" value="%{recorder.money}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('recorder.money')"/></span>
        </td>
    </tr>



    <tr><td class="cInputCaption"><fmt:message key="recorder.kind"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="recorder.kindId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="webCardMoneyList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('recorder.kindId')"/></span>
        </td>
    </tr>


    <tr><td class="cInputCaption"><fmt:message key="recorder.memo"/></td>
        <td class="cInputColumn">
            <ww:textarea name="recorder.memo" value="%{recorder.memo}" cssClass="cInputTextArea" cols="45" rows="8" />
        </td>
    </tr>

    <tr class="cActionButtonLine">
      <td colspan="2">
        
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="recorder.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="recorder.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
