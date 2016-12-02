<%@ include file="/common/taglibs.jsp"%>

<form name="form1" name="form1">
  <ww:hidden name="p" value="${p}"/>
<table border="0" cellspacing="1" class="cContentTable">
      <tr>
        <td class="cContentTitle" ><fmt:message key="recorder.list"/>
        
        <ww:if test="p == 'dis'"> 
           -<fmt:message key="common.dismoney"/>
        </ww:if>
        
        <ww:if test="p == 'save'"> 
            -<fmt:message key="common.addmoney"/>
        </ww:if>
        
        </td>
      </tr>
      
      <tr>
        <td> 
        <img src="images/search.jpg">
          <span class="cLabel2"><fmt:message key="recorder.beginDate"/>:</span>  
            <ww:datepicker cssClass="cInputTextFieldShort" name="beginDate" id="beginDate" value="%{beginDate}" language="zh"  format="%Y/%m/%d"  />
           ~
           <span class="cLabel2"><fmt:message key="recorder.endDate"/>:</span> 
           <ww:datepicker cssClass="cInputTextFieldShort" name="endDate" id="endDate" value="%{endDate}" language="zh"  format="%Y/%m/%d"  />
           <input type="submit" value="<fmt:message key="common.search"/>" class="cButton">
       </td>     
      </tr>
      
      
      <tr class="cActionButtonLine">
        <td>  
        </td>
      </tr>
      <tr>
        <td>

<c:set var="count" value="1" />
<display:table name="recorderList" class="list" cellspacing="1" requestURI="" id="row" export="false" pagesize="${GLOBAL_pagesize}" sort="list">
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

        </td>
    </tr>
    
      <tr class="cActionButtonLine">
        <td>

        </td>
      </tr>  
        
    
 <ww:if test="beginDate != null  && endDate != null">   
 
    <tr>
      <td>
<span class="cLabel2">      
 <fmt:message key="common.subTotal"/>:<ww:property value="sum"/>
 </span>
 <!--
[   
 <a href="download/lst.xls" target="_blank"><span class="cTabPanelLine"><fmt:message key="recorder.download"/></span></a>
]    
-->

<ww:if test="p == 'dis'"> 
<hr>
[   
<a href="http://140.129.140.187/TuitionTicket/POS.asp?rpt=3&beginDate=<ww:property value="beginDate"/>&endDate=<ww:property value="endDate"/>" target="_blank"><span class="cTabPanelLine"><fmt:message key="common.print.detail"/></span></a>
]    
<br>
[   
 <a href="http://140.129.140.187/TuitionTicket/POS.asp?rpt=1&beginDate=<ww:property value="beginDate"/>&endDate=<ww:property value="endDate"/>" target="_blank"><span class="cTabPanelLine"><fmt:message key="common.print.statistics"/></span></a>
]
</ww:if> 


<ww:if test="p == 'save'"> 
<hr>
[   
<a href="http://140.129.140.187/TuitionTicket/POS.asp?rpt=4&beginDate=<ww:property value="beginDate"/>&endDate=<ww:property value="endDate"/>" target="_blank"><span class="cTabPanelLine"><fmt:message key="common.print.detail"/></span></a>
]    
<br>
[   
 <a href="http://140.129.140.187/TuitionTicket/POS.asp?rpt=2&beginDate=<ww:property value="beginDate"/>&endDate=<ww:property value="endDate"/>" target="_blank"><span class="cTabPanelLine"><fmt:message key="common.print.statistics"/></span></a>
]
</ww:if> 


  
      </td>    
    </tr>
</ww:if>        

</table>

</form>


<script>
  beginDate=form1.beginDate.value;
  endDate=form1.endDate.value;
    now=new Date();
    y=now.getYear();
    m=now.getMonth()+1;
    d=now.getDate();
    if(beginDate==""){
    	 form1.beginDate.value=y+"/"+m+"/"+d;    
    }
    if(endDate==""){
    	 form1.endDate.value=y+"/"+m+"/"+d;    
    }
    
  
</script>


