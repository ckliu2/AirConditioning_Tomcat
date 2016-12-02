<%@ include file="/common/taglibs.jsp"%>

<ww:form name="missCardForm" action="saveMissCardForm" method="POST" enctype="multipart/form-data" onsubmit="onSubmit()">
  <ww:hidden name="member.id" value="${member.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="misscard.name"/></td></tr>   

    <tr class="cActionButtonLine">
      <td colspan="2">

      </td>
    </tr>

    <tr><td class="cInputCaption"><fmt:message key="member.cardId"/></td>
        <td class="cInputColumn">
            <ww:property value="member.cardId"/>
        </td>
    </tr>
    
    
   <tr><td class="cInputCaption"><fmt:message key="member.cardNo"/></td>
        <td class="cInputColumn">
            <ww:property value="member.cardNo"/>
        </td>
    </tr> 
    
  <tr><td class="cInputCaption"><fmt:message key="member.cardType"/></td>
        <td class="cInputColumn">
            <ww:property value="member.cardType"/>
        </td>
    </tr>  
    
    <tr><td class="cInputCaption"><fmt:message key="member.name"/></td>
        <td class="cInputColumn">
            <ww:property value="member.name"/>           
        </td>
    </tr>
    
    <tr><td class="cInputCaption"><fmt:message key="card.status"/></td>
        <td class="cInputColumn">
            <ww:property value="member.CardStatus"/>           
        </td>
    </tr>

    
    
   <tr><td class="cInputCaption"></td>
        <td class="cInputColumn">           
           <ww:radio name="missCardIds" 
               list="missCardList"
               listKey="id"
               listValue="caption_"
               cssClass="cInputListField"
            />   
        </td>
    </tr>
   
  
    
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type="submit" value="<fmt:message key="misscard.button"/>" class="cButton">
      </td>
    </tr>
  </table>
</ww:form>

<script>
function onSubmit() {
    return true;
}

</script>


