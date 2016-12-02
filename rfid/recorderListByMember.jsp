<%@ include file="/common/taglibs.jsp"%>

<form name="form1">

<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" >
        <fmt:message key="recorder.log"/>:        
        [<ww:property value="member.cardId"/>-<ww:property value="member.name"/>] 
       /
         <fmt:message key="member.cash"/>:[<ww:property value="member.cash"/>] 
        
        
        </td>
      </tr>
      
      <tr>
        <td> 
        
<table width="100%" border="0">
  <tr>
    <td>
           <img src="images/search.jpg">
           <span class="cLabel2"><fmt:message key="common.keyin"/><fmt:message key="member.cardId"/>:</span>          
           <ww:textfield name="cardId" value="%{cardId}" maxlength="40" cssClass="cInputTextFieldShort" /> 
           <input type="submit" value="<fmt:message key="common.search"/>" class="cButton">
        
    </td>
    <td>
           <input type="button" value="<fmt:message key="recorder.create"/>" class="cButton" onClick="create();">
    </td>
  </tr>
</table>
           
           

        
        
        </td>     
      </tr>
      
      
      <tr class="cActionButtonLine">
        <td>       
        

        </td>
      </tr>
      <tr>
        <td>
<c:set var="count" value="1" />
<display:table name="recorderListByMember" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
    <display:setProperty name="paging.banner.placement" value="bottom" />

    <display:column titleKey="common.id" style="text-align:left" sortable="true">
           <c:out value="${count}" />
     </display:column> 
      
    <display:column property="member.cardId" sortable="true" titleKey="member.cardId" style="text-align:left"/>   
    <display:column property="member.name" sortable="true" titleKey="recorder.member" style="text-align:left"/>
    <display:column property="kind.caption_" sortable="true" titleKey="recorder.kind" style="text-align:left"/>
    <display:column property="money" sortable="true" titleKey="recorder.money" /> 
    
    <display:column property="memo" sortable="true" titleKey="recorder.memo" />
    <display:column property="createdDate" sortable="true" titleKey="common.createdDate" style="text-align:left"/>
    <c:set var="count" value="${count+1}" />
</display:table>
<!--
<a href="download/lst.xls" target="_blank"><span class="cTabPanelLine"><fmt:message key="recorder.download"/></span></a>
 -->
 
        </td>
    </tr>
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>
</table>

<script>
 function create(){
   window.location="editRecorder.html?cardId=<ww:property value='cardId'/>";  
}
</script>

</form>
