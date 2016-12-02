<%@ include file="/common/taglibs.jsp"%>

<ww:form name="ruleForm" action="saveRule" method="POST" onsubmit="onSubmit()">
  <ww:hidden name="rule.id" value="${rule.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="rule.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="rule.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="rule.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="rule.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:textfield name="rule.name" value="%{rule.name}" maxlength="30" cssClass="cInputTextFieldLong" />
            
        </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="deviceProperty.name"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
            <ww:select name="rule.devicePropertyId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="devicePropertyList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            />
            <span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('rule.devicePropertyId')"/></span>
        </td>
    </tr>

   <!--
    <tr><td class="cInputCaption"><fmt:message key="rule.during"/><br><fmt:message key="rule.disabled"/></td>
        <td class="cInputColumn">
            <ww:textfield name="rule.during" value="%{rule.during}" cssClass="cInputTextFieldTiny" /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('rule.during')"/></span>
        </td>
    </tr>
  -->
    <tr><td class="cInputCaption"><fmt:message key="rule.status"/></td>
        <td class="cInputColumn">
            <ww:select name="rule.statusId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="statusList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('rule.statusId')"/></span>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="rule.times"/><br><fmt:message key="rule.disabled"/></td>
        <td class="cInputColumn">
         <ww:hidden name="rule.timesId" value="${rule.timesId}"/>             
             <ww:textfield name="second " value="%{second}" cssClass="cInputTextFieldTiny" />
             <fmt:message key="rule.period"/>
             /
             
             <ww:textfield name="period" value="%{period}" cssClass="cInputTextFieldTiny" />
             <fmt:message key="rule.second"/>
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="evenLevel.name"/></td>
        <td class="cInputColumn">
        
        <%--
            <ww:select name="rule.evenLevelId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="evenLevelList"
               listKey="id"
               listValue="name"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('rule.evenLevelId')"/></span>
        --%>
        
        </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="rule.decision"/><span class="cRequired">*</span></td>
        <td class="cInputColumn">
         <%--
            <ww:select name="rule.decisionId" 
               headerKey=""
               headerValue="%{getText('common.pleaseSelect')}..."
               list="decisionList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            /><span class="cInputValidationError"><ww:property value="showHtmlErrorMessage('rule.decisionId')"/></span>
        --%>
        </td>
    </tr>
    
    
    
     <tr><td class="cInputCaption"><fmt:message key="rule.condition"/></td>
        <td class="cInputColumn">
            <table>
            <tr>
                <th align="center"><span style="font-size:10pt"><fmt:message key="common.available"/><fmt:message key="rule.condition"/></style></th>
                <th>&nbsp;</th>
                <th align="center"><span style="font-size:10pt"><fmt:message key="common.selected"/><fmt:message key="rule.condition"/></style></th>
            </tr><tr>
            <td>
            <%--
                <ww:select id="allCondition" name="allCondition"
                list="conditionList"
                listKey="id"
                listValue="valueTw"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                /> 
             --%>   
            </td><td>
                <input type="button" value=">>" class="cSelectButton" onclick="moveAll(allCondition, selectedCondition);"><br>
                <input type="button" value=">"  class="cSelectButton" onclick="moveOne(allCondition, selectedCondition);"><br>
                <input type="button" value="<"  class="cSelectButton" onclick="moveOne(selectedCondition, allCondition);"><br>
                <input type="button" value="<<" class="cSelectButton" onclick="moveAll(selectedCondition, allCondition);"><br>
            </td>
            
            <td align="center">
<%--
                <ww:select id="selectedCondition" name="conditionsIds"
                list="ruleConditionList"
                listKey="id"
                listValue="valueTw"
                multiple="true"
                size="8"
                cssClass="cQueryFieldList"
                /> 
 --%>          
 
             
               
               
           
            </td>
            </tr>
            </table>
        </td>
    </tr>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <tr><td class="cInputCaption"><fmt:message key="common.remark"/></td>
        <td class="cInputColumn">
            <ww:textarea name="rule.memo" value="%{rule.memo}" cssClass="cInputTextArea" cols="45" rows="5" />      
        </td>
    </tr>
    
    
    
    <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="rule.createdDate" /></span>
        </td>
    </tr>
    
    
   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="rule.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="rule.createdUser.name"/>
        </td>
    </tr>

    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="rule.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="rule.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>


<script>
   function onSubmit() {
     mySelectAll(document.ruleForm.conditionsIds);
     return true;
   }
</script>
