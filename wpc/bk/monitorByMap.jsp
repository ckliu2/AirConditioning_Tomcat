<%@ include file="/common/unsecureTaglibs.jsp"%>

<script language="javascript">
	var http_request = false;
	var url="http://140.129.140.55:8080/wpc/upload/xml/status1.xml";
	function send_request() {//初始化、指定处理函数、发送请求的函数
		http_request = false;
		//开始初始化XMLHttpRequest对象
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {//设置MiME类别
				http_request.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request) { // 异常，创建对象实例失败
			window.alert("XMLHttpRequest error..");
			return false;
		}
		http_request.onreadystatechange = processRequest;
		// 确定发送请求的方式和URL以及是否同步执行下段代码
		http_request.open("GET", url, true);
		http_request.send(null);
	}
	// 处理返回信息的函数
    function processRequest() {
        if (http_request.readyState == 4) { // 判断对象状态
            if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
				var returnObj = http_request.responseXML;
				var xmlobj = http_request.responseXML;
				var employees = xmlobj.getElementsByTagName("status");
				var feedbackStr = "";
				for(var i=0;i<employees.length;i++) {
					var employee = employees[i];
					feedbackStr += "sensor id= " + employee.getElementsByTagName("sensor")[0].firstChild.data;
					feedbackStr +=  "\r\n";
					  document.getElementById('xTable').rows[0].cells[0].style.backgroundColor="#FF0000";
				}
				alert(feedbackStr);
            } else { //页面不正常
                alert("processRequest error..");
            }
        }
    }
</script>

<html>
	<body>
    <p>
      <!--
    <input type="button" name="read" value="读取XML" onClick="send_request('http://140.129.140.55:8080/wpc/upload/xml/status1.xml')">
    -->
    </p>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="20%">&nbsp;</td>
        <td width="80%"><input type="button" name="read" value="XML" onClick="send_request()"></td>
      </tr>
      <tr>
        <td align="left" valign="top">
        
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#0000FF" id="xTable">
          <tr>
            <td>id</td>
            <td>sensor</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        
        
        
        </td>
        <td><img src="images/tnitMap.jpg" width="762" height="500"></td>
      </tr>
    </table>
    
    
    
    <p>&nbsp; </p>
	</body>
</html>

