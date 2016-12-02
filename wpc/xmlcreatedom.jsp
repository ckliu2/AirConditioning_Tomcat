<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>
<%@page import="javax.xml.parsers.*" %>
<%@page import="org.w3c.dom.*" %>

<%@page import="javax.xml.transform.*" %>
<%@page import="javax.xml.transform.stream.*" %>
<%@page import="javax.xml.transform.dom.*" %>

<%@page import="java.io.*" %>

<html>
    <head><title>建立 XML</title></head>
    <body>
    <%
        DocumentBuilderFactory theDocumentBuilderFactory= 
                DocumentBuilderFactory.newInstance() ; 
        DocumentBuilder theDocumentBuilder = 
                theDocumentBuilderFactory.newDocumentBuilder() ; 
        DOMImplementation theDOMImplementation = theDocumentBuilder.getDOMImplementation() ; 
                
        Document theDocument = theDOMImplementation.createDocument(null,"customers",null) ; 
        Element theElement = theDocument.getDocumentElement() ; 
        //建立節點
        Element theElementcustomer = theDocument.createElementNS(null,"customer") ; 
        Element theElementcustomerid =theDocument.createElementNS(null,"customerid") ; 
        Element theElementcustomername =theDocument.createElementNS(null,"customername") ; 
        Element theElementtel =theDocument.createElementNS(null,"tel") ; 
        Element theElementemail =theDocument.createElementNS(null,"email") ; 
        
        Node theNodeCustomerid = theDocument.createTextNode("1001") ; 
        Node theNodeCustomername = theDocument.createTextNode("王大維") ; 
        Node theNodetel = theDocument.createTextNode("02-35330000") ; 
        Node theNodeemail= theDocument.createTextNode("jack@testMail.com.tw") ; 
                
        theElementcustomerid.appendChild(theNodeCustomerid) ; 
        theElementcustomername.appendChild(theNodeCustomername) ; 
        theElementtel.appendChild(theNodetel) ; 
        theElementemail.appendChild(theNodeemail) ; 
        
        theElementcustomer.appendChild(theElementcustomerid) ; 
        theElementcustomer.appendChild(theElementcustomername) ; 
        theElementcustomer.appendChild(theElementtel) ; 
        theElementcustomer.appendChild(theElementemail) ;     
        
        theElement.appendChild(theElementcustomer) ;    
     
       
       TransformerFactory tff= TransformerFactory.newInstance();
       Transformer theTransformer=tff.newTransformer();
       theTransformer.setOutputProperty(OutputKeys.ENCODING,"Big5") ; 
       
       DOMSource theDOMSource = new DOMSource(theDocument) ;
       File theFile = new File(request.getRealPath("/"+"ch17//xmlFile//newCustomers.xml")) ; 
       theFile.createNewFile() ;           
       StreamResult theStreamResult = new StreamResult(out) ;
       theTransformer.transform(theDOMSource,theStreamResult) ;       
      
       out.println("XML檔案建立完成　!!") ;         
    %>
    </body>
</html>
