<%@ page contentType="text/html;charset=utf-8" buffer="16kb"%><%@ page language="java" errorPage="/common/error.jsp" %><%@ page import="javax.servlet.http.HttpSession" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%@ taglib uri="http://displaytag.sf.net" prefix="display" %><%@ taglib uri="/webwork" prefix="ww" %><c:set var="datePattern"><fmt:message key="date.format"/></c:set><c:set var="ctx" value="${pageContext.request.contextPath}"/><%
    response.addHeader("Pragma", "no-cache");
    response.setHeader("Cache-control", "no-store");
    response.setHeader("Cache-control", "no-cache");
    response.setDateHeader("Expires", 0);

    response.setContentType("text/html;charset=UTF-8");
    out.print(prj.counter.MyCaptchaServlet.getAndRemove(request.getParameter("capt")));
%>