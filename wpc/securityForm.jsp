<%@ include file="/common/taglibs.jsp"%>

<ww:form name="securityForm" action="saveSecurity" method="POST"  onsubmit="onSubmit()">
  <ww:hidden name="security.id" value="${security.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="security.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="security.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="security.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="security.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="security.name" value="%{security.name}" maxlength="30" cssClass="cInputTextFieldLong" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('security.name')"/></span>
        </td>
    </tr>
    
    
    
        <tr><td class="cInputCaption"><fmt:message key="security.member"/></td>
      <td class="cInputColumn">

              <ww:select id="membersIds"   name="membersIds" 
                list="memberList"
                listKey="id"
                listValue="name"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                />
                
            
            
            
            
            <input class="cOpenWindowButton" type=button value="<fmt:message key="common.insert"/>" onclick="myInsertFromNewWindow('queryMemberListTop.html', 'membersIds', '');">
            <input class="cOpenWindowButton" type=button value="<fmt:message key="common.delete"/>" onclick="myDeleteFromSelectMany(document.securityForm.membersIds);">
        
            
            </td>
    </tr>
    
    

    <tr><td class="cInputCaption"><fmt:message key="common.remark"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textarea name="security.memo" value="%{security.memo}" cssClass="cInputTextArea" cols="45" rows="8" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('security.memo')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="security.createdDate" /></span>
        </td>
    </tr>






    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="security.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="security.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
  
  
<script>
function onSubmit() {
   mySelectAll(document.securityForm.membersIds);
 return true;
}
</script>

</ww:form>
