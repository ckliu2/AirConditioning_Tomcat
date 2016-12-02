<%@ page language="java" errorPage="/error.jsp" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="/webwork" prefix="ww" %>
<c:set var="datePattern"><fmt:message key="date.format"/></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    response.addHeader("Pragma", "no-cache");
    response.setHeader("Cache-control", "no-store");
    response.setHeader("Cache-control", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setContentType("text/html;charset=UTF-8");
    com.common.util.Util.IMAGE_CONTEXT_ROOT_PATH = "/AirConditioning";
%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/displaytag.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />


<!--tips-->
<script src="${ctx}/scripts/jquery-1.3.2.min.js"></script>
<script src="${ctx}/scripts/justthetip.js"></script>
<link rel="stylesheet" href="${ctx}/css/justthetip.css"> 




<!--bankui-->
<script src="${ctx}/scripts/jquery.blockUI.js"></script>

<%

com.base.value.SessionUser sessionUser = (com.base.value.SessionUser) request.getSession().getAttribute("user");

if (sessionUser == null) 
{
  response.sendRedirect(com.common.util.Util.IMAGE_CONTEXT_ROOT_PATH); 
}

%> 




