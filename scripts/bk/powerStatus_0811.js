/*********************************************************************
Function
*********************************************************************/
	function now(){
		var aa=new Date();
		bb=aa.getYear()+"/"+(aa.getMonth()+1)+"/"+aa.getDate()+" "+aa.getHours()+":"+aa.getMinutes()+" "+aa.getSeconds();
        document.all.cc.innerHTML=bb;
		    window.setTimeout("now()",1000);
	}  

/*********************************************************************
AJAX 
*********************************************************************/
var http_request = false;
	function sendRequest(urls,func) {
		 http_request = false;
		if(window.XMLHttpRequest) { 
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {
				http_request.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { 
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request) {
			//window.alert("XMLHttpRequest error..");
			return false;
		}
		http_request.onreadystatechange = eval(func);	
		http_request.open("GET", urls, true);
		http_request.send(null);
	}
	
	
    function devicePowerStatus() {
        if (http_request.readyState == 4) { 
            if (http_request.status == 200) { 
                if(http_request.responseText==2){
                	alert('電源控制器已開啟.\n需等候5秒畫面才會更新');                
                }else{
                	alert('電源控制器已關閉.\n需等候5秒畫面才會更新');                
                }
                
            } else { 
                //alert("processRequest() error..");
            }
        }
    }
    
    
	 function getStatusXML() {
        if (http_request.readyState == 4) { 
            if (http_request.status == 200) {
				var returnObj = http_request.responseXML;
				var xmlobj = http_request.responseXML;
				var doors = xmlobj.getElementsByTagName("door");
				for(var i=0;i<doors.length;i++) { 
					var door = doors[i];
					  var did=door.getAttribute("id");
					  var dstatus=door.getElementsByTagName("status")[0].firstChild.data;
					  var rtime=door.getElementsByTagName("time")[0].firstChild.data;					  
					  var settemp=door.getElementsByTagName("settemp")[0].firstChild.data;
					  var inlettemp=door.getElementsByTagName("inlettemp")[0].firstChild.data;
					  var setting_mode=door.getElementsByTagName("setting_mode")[0].firstChild.data;
					  var setting_driveItem=door.getElementsByTagName("setting_driveItem")[0].firstChild.data;
					  var setting_modeItem=door.getElementsByTagName("setting_modeItem")[0].firstChild.data;
					  
					  
					  //alert(did+"--"+dstatus+"--"+rtime+"--"+settemp+"--"+inlettemp);
					  
					  //alert(rtime);
					  
					  var obj=document.getElementById(did);
					   if(obj!=null){
					   	//alert(did+"--"+dstatus+"--"+rtime+"--"+settemp+"--"+inlettemp);
					   	  				 
					   	 if(dstatus=='OFF'){
					   	 	 document.getElementById(did).style.backgroundColor="#99FF66";
					   	 }else{
					   		 document.getElementById(did).style.backgroundColor="#FF0000";
					   	 } 		
					   	 
				       
				       var time=eval('document.all.time'+did);
				       time.innerHTML=rtime;
				       
				       var dtemp=eval('document.all.dinlettemp'+did);
				       dtemp.innerHTML=inlettemp+'C';
				       
				       //設備屬性
				       var attr='',attr1='';
				       
				       attr+='設定溫度:'+settemp+'<BR>';
				       attr+='是否開啟:'+dstatus+'<BR>';
				       attr+='冷氣模式:'+setting_mode+'<BR>';
				       attr+='准許手動控制開關:'+setting_driveItem+'<BR>';				      
				       attr+='准許手動更改冷氣模式:'+setting_modeItem+'<BR>';
				       
				       var setting=eval('document.all.setting'+did);
				       setting.innerHTML=attr;
				       
				       //schedule
				       var schedule=eval('document.all.schedule'+did);
				       var scheduleDaily="scheduleDaily.html?readerId="+did;
				       var scheduleWeekly="scheduleWeekly.html?readerId="+did;
				       attr1+="<a href="+scheduleDaily+" target='_blank'><font color='white'>每日排程</font></a><BR><BR>";
				       attr1+="<a href="+scheduleWeekly+" target='_blank'><font color='white'>每周排程</font></a><BR><BR>";
				       schedule.innerHTML=attr1;
				     
					   }
					   
				   }				
				
            } else { 
                //alert("processRequest() Error..");
            }
        }
    }
    
    


 	var http_request1 = false;
	function sendRequest1(urls,func) {
		 http_request1 = false;
		if(window.XMLHttpRequest) { 
			http_request1 = new XMLHttpRequest();
			if (http_request1.overrideMimeType) {
				http_request1.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { 
			try {
				http_request1 = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request1 = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request1) {
			//window.alert("XMLHttpRequest error..");
			return false;
		}
		http_request1.onreadystatechange = eval(func);	
		http_request1.open("GET", urls, true);
		http_request1.send(null);
	}   
    
   function getInstantPowerXML() {   
        if (http_request1.readyState == 4) { 
            if (http_request1.status == 200) {
				var returnObj = http_request1.responseXML;
				var xmlobj = http_request1.responseXML;				
				 var power=xmlobj.getElementsByTagName("power")[0].firstChild.data;
				 var rd=xmlobj.getElementsByTagName("recdate")[0].firstChild.data;
				 document.all.power.innerHTML=power;
				 document.all.recdate.innerHTML=rd;		
				 //alert(power+'---'+rd);		 
            } else { 
                //alert("processRequest() Error..");
            }
        }
    }    
    

/******************************************************************/

 	var http_request2 = false;
	function sendRequest2(urls,func) {
		 http_request2 = false;
		if(window.XMLHttpRequest) { 
			http_request2 = new XMLHttpRequest();
			if (http_request2.overrideMimeType) {
				http_request2.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { 
			try {
				http_request2 = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request2 = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request2) {
			//window.alert("XMLHttpRequest error..");
			return false;
		}
		http_request2.onreadystatechange =  eval(func);	
		http_request2.open("GET", urls, true);
		http_request2.send(null);
	}   
    
    
    function devicePower() {
        if (http_request2.readyState == 4) { 
            if (http_request2.status == 200) { 
                if(http_request2.responseText==2){
                	alert('電源控制器已全部開啟.\n需等候5秒畫面才會更新');                
                }else{
                	alert('電源控制器已全部關閉.\n需等候5秒畫面才會更新');                
                }                
            } else { 
                //alert("processRequest() error..");
            }
        }
    }
    
/******************************shutdown***********************************/

 	var http_request3 = false;
	function sendRequest3(urls,func) {
		 http_request3 = false;
		if(window.XMLHttpRequest) { 
			http_request3 = new XMLHttpRequest();
			if (http_request3.overrideMimeType) {
				http_request3.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { 
			try {
				http_request3 = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request3 = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request3) {
			//window.alert("XMLHttpRequest error..");
			return false;
		}
		http_request3.onreadystatechange = eval(func);	
		http_request3.open("GET", urls, true);
		http_request3.send(null);
	}   
    
   function shutdown() {   
        if (http_request3.readyState == 4) { 
            if (http_request3.status == 200) {
				     var returnObj = http_request3.responseXML;
				     var xmlobj = http_request3.responseXML;				
				     var t=xmlobj.getElementsByTagName("shutmsg")[0].firstChild.data;			
				       if(t=='SAFE'){	
				       	//alert("t is none");
				       	document.getElementById('EventT').style.display="None"; 
				      }else{
				      	document.getElementById('EventT').style.display=""; 
				      	document.all.shutmsg.innerHTML=t;
				        document.getElementById('EventT').style.backgroundColor="#FFCC66";		
				      }
				     	    
		
            } else { 
                //alert("processRequest() Error..");
            }
        }
    }    
    
    
    
function mouseOver(){
  //alert('mouseOver');
  //	window.status='這是範例';
	tsaiannie('<font size="2" color="#CC0000">這是範例一<br>您可不做任何鏈結。</font>');
	return true;
}

function mouseOut()
{
  //alert('mouseOut');
}    


