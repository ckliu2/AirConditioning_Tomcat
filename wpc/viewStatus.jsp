<%@ include file="/common/unsecureTaglibs.jsp"%>

viewStatus


<body  >

xml=<ww:property value="xml"/>



<script>


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

function XmlGet()
{  var Hnd;

   Hnd=NewRequest();
   
   if(Hnd)
   {  m_HndGet=Hnd;
      Hnd.onreadystatechange = UpdateTbl;
      //http://140.129.140.55:8080/wpc/cgidio.xml
      Hnd.open('GET', 'http://140.129.140.55/wpc/viewXML.html', true);
      Hnd.send(null);
   }
}


function window_onload() 
{
   //XmlGet();
   //window.setInterval("XmlGet()",2000);
}
</script>


</body>
