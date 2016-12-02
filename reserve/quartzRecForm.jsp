<%@ include file="/common/unsecureTaglibs.jsp"%>
<%@ page contentType="text/html; charset=utf-8" language="java"  %>

 <ww:set name="weekc" value="%{getChineseWeek(${quartzRec.week})}"/>

<table width="60%" border="0" align="center" cellspacing="1"  >
  <tr class="cActionButtonLine">
    <td colspan="2"><div align="center">下載明細</div></td>
  </tr>
  <tr>
    <td class="cInputCaption">下載時間</td>
    <td class="cInputCaption">${quartzRec.quartzDate}</td>
  </tr>
  <tr>
    <td class="cInputCaption">星期</td>   
    <td class="cInputCaption">${weekc}</td>
  </tr>
  <tr>
    <td class="cInputCaption">節電讀卡機名稱</td>
    <td class="cInputCaption">${quartzRec.classInfo.reader} </td>
  </tr>
  <tr>
    <td class="cInputCaption">課程名稱</td>
    <td class="cInputCaption">${quartzRec.classInfo.course.name} (${quartzRec.classInfo.course.id})</td>
  </tr>
  <tr>
    <td class="cInputCaption">下載授課教師</td>
    <td class="cInputCaption">( ${quartzRec.teacher.cardId} - ${quartzRec.teacher} ) ${quartzRec.teacher.cardNo}</td>
  </tr>
  <tr>
    <td class="cInputCaption">下載上課學生總數</td>
    <td class="cInputCaption">${fn:length(quartzRec.students)}</td>
  </tr>
  <tr>
    <td class="cInputCaption">下載上課學生明細4</td>
    <td class="cInputCaption">
    <table width="100%" border="0">
    <c:forEach var="rows" items="${quartzRec.students}"  varStatus="loopCount"> 
      <tr>
        <td>${loopCount.count}</td>
        <td>${rows.cardId}</td>
        <td>${rows.name}</td>
        <td>${rows.cardNo}</td>
      </tr>
       </c:forEach>  
    </table>    </td>
  </tr>
  <tr class="cActionButtonLine">
    <td colspan="2">&nbsp;</td>
  </tr>
</table>

