<%@ include file="/common/unsecureTaglibs.jsp"%>



<html>
	<body onLoad="window_onload();">
    <p>
      <!--
    <input type="button" name="read" value="¶ÁÈ¡XML" onClick="send_request('http://140.129.140.55:8080/wpc/upload/xml/status1.xml')">
    -->
    </p>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="20%">&nbsp;</td>
        <td width="80%"><input type="button" name="read" value="XML" onClick="loadXML(makeTable)"></td>
      </tr>
      <tr>
        <td align="left" valign="top">
        
        
        <table id="xTable" border="1" style="border-collapse: collapse; font-family:Arial; font-size:11 pt" bordercolor="#111111" cellspacing="0" width="253" height="244">
        <tr>
          <td width="29" align="center" height="17">Sensor</td>
          <td width="67" align="center" height="17">State</td>
          <td width="17" align="center" height="17">Memo</td>
        </tr>
        <tr>
          <td width="29" align="center" height="26">1</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="26">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="26">2</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="26">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="26">3</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="26">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="26">4</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="26">&nbsp;
          </td>
        </tr>
        <tr>
          <td width="29" align="center" height="28">5</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="28">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="17">6</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="17">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="15">7</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="15">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="17">8</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="17">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="17">9</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="17">&nbsp;</td>
        </tr>
        <tr>
          <td width="29" align="center" height="17">10</td>
          <td width="67" align="center" height="30">&nbsp;</td>
          <td width="17" align="center" height="17">&nbsp;</td>
        </tr>
      </table>
        
        
        
        
        
        </td>
        <td><img src="images/tnitMap.jpg" width="762" height="500"></td>
      </tr>
    </table>

<script ID="clientEventHandlersJS" LANGUAGE="javascript">
<!--

// Public Variables
var m_HndGet= null;

// Create new http XML request object
function NewRequest() 
{   var Hnd;

    Hnd=null;
    // For Microsoft IE
    if (window.ActiveXObject) 
    {  try {  Hnd= new ActiveXObject("Msxml2.XMLHTTP");  }
       catch (e) 
       {  try { Hnd= new ActiveXObject("Microsoft.XMLHTTP");   } 
          catch (e) 
          {  alert('Error: IE ActiveXObject');
          }
       }
    }
    // For Mozilla, Safari,...
    else if (window.XMLHttpRequest) 
    {    Hnd= new XMLHttpRequest();
         if (Hnd.overrideMimeType) 
         {   Hnd.overrideMimeType('text/xml');
         }
    } 
    // Browser not supported
    if (!Hnd) 
    {   alert('Error: Cannot create an XMLHTTP instance');
    }
    return Hnd;
}

// Update table contents
function UpdateTbl() 
{   var xDoc,Hnd;
    var i,v,color;
	
	Hnd=m_HndGet;
	// check http status
    if (Hnd.readyState != 4) return;
    if (Hnd.status != 200) return;
    // set table contents with XML data
    xDoc = Hnd.responseXML;
	
    for(j=1;j<10;j++)
    {
	   color="#00FF00";
       document.getElementById('xTable').rows[j].cells[1].style.backgroundColor=color;
	}
    for(i=0;i<10;i++)
    {  
	   v=xDoc.getElementsByTagName("sensor").item(i).firstChild.data;
	   
	   
	   var length=document.getElementById("xTable").rows.length;
	   //alert("length="+length);
       //if(v=="1") color="#FF0000"; else color="#00FF00";
	   color="#FF0000";
       document.getElementById('xTable').rows[v].cells[1].style.backgroundColor=color;
    }
}

// Get latest IO status with GET method
function XmlGet()
{  var Hnd;

   Hnd=NewRequest();
   //alert(Hnd);
   
   if(Hnd)
   {  m_HndGet=Hnd;
      Hnd.onreadystatechange = UpdateTbl;
      //http://140.129.140.55:8080/wpc/cgidio.xml
      Hnd.open('GET', 'http://140.129.140.55:8080/wpc/upload/xml/status.xml', true);
      Hnd.send(null);
   }
}




function window_onload() 
{
   // first update
   XmlGet();
   // auto update every 2 seconds
   window.setInterval("XmlGet()",1000);
}

</script>

	</body>
</html>

