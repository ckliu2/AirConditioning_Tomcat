<%@ include file="/common/taglibs.jsp"%>
<ww:set name="ls" value="%{readerByJSON()}"/>  
<c:out value="${ls}" escapeXml="false"/>
