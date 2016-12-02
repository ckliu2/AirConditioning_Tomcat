<%@ include file="/common/taglibs.jsp"%>

<ww:form name="buildingForm" action="saveBuilding" method="POST" enctype="multipart/form-data">

  <ww:hidden name="building.id" value="${building.id}"/>
  <table border="0" cellspacing="1" class="cContentTable">
    <tr><td class="cContentTitle" colspan="2" ><fmt:message key="building.form"/></td></tr>
    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="building.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="building.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
    <tr><td class="cInputCaption"><fmt:message key="building.name"/></td>
        <td class="cInputColumn">
            <ww:textfield name="building.name" value="%{building.name}" maxlength="30" cssClass="cInputTextFieldShort" />
        </td>
    </tr>


    
    
    
     <tr><td class="cInputCaption"><fmt:message key="member.photo"/></td>
        <td class="cInputColumn">
        <ww:if test="building.photo != null">
            <input type="checkbox" name="removePhoto" onclick="if (this.checked == true) document.buildingForm.filePhoto.style.display='inline'; else document.buildingForm.filePhoto.style.display='none';" value="<ww:property value="building.photo.fileName"/>"><fmt:message key="common.delete"/>
            <a href="${ctx}/<fmt:message key="building.uploadPhoto.relativeUrl"/>/<ww:property value="building.id"/>/<ww:property value="building.photo.fileName"/>"><ww:property value="building.photo.fileName" /> (<ww:property value="building.photo.size" /> bytes)</a><br>
            <ww:file cssClass="cInputTextFieldLong" cssStyle="height:20px;display:none" name="filePhoto" accept="application/pdf,application/msword,application/vnd.ms-excel,application/vnd.ms-powerpoint,image/gif,image/jpeg,image/bmp,image/png,image/tiff" />
            <ww:hidden name="building.photoId" value="${building.photo.id}"/>
            <ww:hidden name="building.photoFileName" value="${building.photo.fileName}"/>
        </ww:if>
        <ww:else>
            <ww:file cssClass="cInputTextFieldLong" cssStyle="height:20px" name="filePhoto" accept="application/pdf,application/msword,application/vnd.ms-excel,application/vnd.ms-powerpoint,image/gif,image/jpeg,image/bmp,image/png,image/tiff" /><br>
        </ww:else>

        </td>
    </tr>
    
   <ww:if test="building.photo != null">
    <tr><td class="cInputCaption"><fmt:message key="member.photo"/></td>
        <td class="cInputColumn">
        <img border="0" src="<fmt:message key="building.uploadPhoto.relativeUrl"/>/${building.id}/${building.photo.fileName}" width="150" />
      </td>
    </tr>
    </ww:if>
    
    
    
   <tr><td class="cInputCaption"><fmt:message key="common.lastModifiedUser"/></td>
        <td class="cInputColumn">
            <ww:property value="building.member.name"/>
        </td>
    </tr>
    
   <tr><td class="cInputCaption"><fmt:message key="common.createdUser"/></td>
        <td class="cInputColumn">
            <ww:property value="building.createdUser.name"/>
        </td>
    </tr>
    
     <tr><td class="cInputCaption"><fmt:message key="common.createdDate"/></td>
        <td class="cInputColumn">
            <span class="cLabel"><ww:property value="building.createdDate" /></span>
        </td>
    </tr>


    <tr class="cActionButtonLine">
      <td colspan="2">
        <input type=button onclick="javascript:history.back()" class="cButton" value="<fmt:message key="common.back"/>" >
        <ww:if test="recordEditable == true">
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton">&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton">&nbsp;
            <ww:if test="building.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>" class="cButton">
            </ww:if>
        </ww:if>
        <ww:else>
            <input type="submit" value="<fmt:message key="common.save"/>" class="cButton" DISABLED>&nbsp;
            <input type="reset" value="<fmt:message key="common.reset"/>" class="cButton" DISABLED>&nbsp;
            <ww:if test="building.id != null">
              <input type="submit" name="delete" onClick="javascript:return confirm('<fmt:message key="common.confirmDelete"/>')" value="<fmt:message key="common.delete"/>"  class="cButton" DISABLED>
            </ww:if>
        </ww:else>
      </td>
    </tr>
  </table>
</ww:form>
