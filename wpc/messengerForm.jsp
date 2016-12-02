<%@ include file="/common/taglibs.jsp"%>

<ww:form name="messengerForm" action="saveMessenger" method="POST"  onsubmit="onSubmit()">
  <ww:hidden name="messenger.id" value="${messenger.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="messenger.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="messenger.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="messenger.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="messenger.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="messenger.name" value="%{messenger.name}" maxlength="30" cssClass="cInputTextFieldLong" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('messenger.name')"/></span>
        </td>
    </tr>
    
    
    
            <tr><td class="cInputCaption"><fmt:message key="security.name"/></td>
        <td class="cInputColumn">
            <table>
            <tr>
                <th align="center"><span style="font-size:10pt"><fmt:message key="common.available"/><fmt:message key="security.name"/></style></th>
                <th>&nbsp;</th>
                <th align="center"><span style="font-size:10pt"><fmt:message key="common.selected"/><fmt:message key="security.name"/></style></th>
            </tr><tr>
            <td >
            
                <ww:select id="allSecurity" name="allSecurity"
                list="securityList"
                listKey="id"
                listValue="name"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                />  
                          
                </td><td>
                <input type="button" value=">>" class="cSelectButton" onclick="moveAll(allSecurity, selectedSecurity);"><br>
                <input type="button" value=">"  class="cSelectButton" onclick="moveOne(allSecurity, selectedSecurity);"><br>
                <input type="button" value="<"  class="cSelectButton" onclick="moveOne(selectedSecurity, allSecurity);"><br>
                <input type="button" value="<<" class="cSelectButton" onclick="moveAll(selectedSecurity, allSecurity);"><br>
            </td>
            
            <td align="center">


           
                <ww:select name="securityIds" id="selectedSecurity"
                list="messenger_securityList"
                listKey="id"
                listValue="name"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                />   
            
               
               
           
            </td>
            </tr>
            
            
            </table>
        </td>
    </tr>
    
    

    <tr><td class="cInputCaption"><fmt:message key="common.remark"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textarea name="messenger.memo" value="%{messenger.memo}" cssClass="cInputTextArea" cols="45" rows="8" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('messenger.memo')"/></span>
        </td>
    </tr>

   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="messenger.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="messenger.createdUser.name"/>
        </td>
    </tr>


    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="messenger.createdDate" /></span>
        </td>
    </tr>



    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="messenger.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="messenger.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
  
  
<script>
   function onSubmit() {
     mySelectAll(document.messengerForm.securityIds);
     return true;
   }
</script>





</ww:form>
