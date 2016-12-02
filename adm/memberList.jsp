<%@ include file="/common/taglibs.jsp"%>

<form>
           <img src="images/search.jpg">
           <span class="cLabel2"><fmt:message key="common.keyin"/><fmt:message key="member.cardId"/>:</span>          
           <ww:textfield name="cardId" value="%{cardId}" maxlength="40" cssClass="cInputTextFieldShort" /> 
           <input type="submit" value="<fmt:message key="common.search"/>" class="cButton">
           <br>

          <input  type="button" class="cButton" onClick="location.href='editMember.html'"  value="<fmt:message key='common.new'/>"/>
</form>



<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="member.list"/></td>
      </tr>    

      <tr>
        <td>

<c:set var="count" value="1" />
<display:table name="memberList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />
    
     <display:column titleKey="common.id" style="text-align:left" sortable="true">     
        <c:out value="${count}"/>
     </display:column>
    
    <display:column property="cardId" sortable="true" titleKey="member.cardId" /> 
    <display:column property="name" sortable="true" titleKey="member.name" style="text-align:left" />

        
    <display:column property="cardNo" sortable="true" titleKey="member.cardNo" /> 
    <display:column property="groups" sortable="true" titleKey="member.group" />
    <display:column property="enabled" sortable="true" titleKey="member.enabled" />
    
    <display:column property="email" sortable="true" titleKey="member.email" /> 
    
    <display:column property="cellphone" sortable="true" titleKey="member.cellphone" /> 
     
    <display:column titleKey="common.action">
        <ww:if test="recordEditable == true">
            <a href="editMember.html?member.id=<c:out value="${row.id}"/>"><fmt:message key="common.edit"/></a>&nbsp;&nbsp;
            <a href="#" onClick="javascript:return myConfirm('<fmt:message key="common.confirmDelete1"/><c:out value="${row.caption_}" /><fmt:message key="common.confirmDelete2"/>', 'form1', 'member.id', '${row.id}')"><fmt:message key="common.delete"/></a>
        </ww:if>
        <ww:else>
           <a href="editMember.html?member.id=<c:out value="${row.id}"/>"><fmt:message key="common.view"/></a>&nbsp;&nbsp;
        </ww:else>
    </display:column>
    
    

    
    <c:set var="count" value="${count+1}" />
</display:table> 



     

</td>
    </tr>

</table>


<form name="form1" action="saveMember.html">
    <input type="hidden" name="delete" value="yes">
    <input type="hidden" name="member.id" value="">
    <select name="selectedMemberIds" multiple="true" style="display:none"></select>
</form>







