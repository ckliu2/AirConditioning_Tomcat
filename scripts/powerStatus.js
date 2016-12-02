

/*********************************************************************
AJAX 
*********************************************************************/

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
		http_request2.onreadystatechange = eval(func);	
		//http_request2.open("GET", urls, true);
		http_request2.open("GET", urls + '?_=' + Math.random(), true);
		http_request2.send(null);
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
		//http_request1.open("GET", urls, true);
		http_request1.open("GET", urls + '?_=' + Math.random(), true);
		http_request1.send(null);
	}





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
		//http_request.open("GET", urls, true);
		http_request.open("GET", urls + '?_=' + Math.random(), true);
		http_request.send(null);
	}
	
	
	
	function getStatusXML1() {
    if (http_request1.readyState == 4) { 
       if (http_request1.status == 200) {
				var returnObj = http_request1.responseXML;
				var xmlobj = http_request1.responseXML;
				var doors = xmlobj.getElementsByTagName("door");
				for(var i=0;i<doors.length;i++) { 
					var door = doors[i];
					  var did=door.getAttribute("id");
					  var dstatus=door.getElementsByTagName("status")[0].firstChild.data;
					  var rtime=door.getElementsByTagName("time")[0].firstChild.data;
					  var obj=document.getElementById(did);
						if(obj!=null){
						  var time=eval('document.all.time'+did);
				      time.innerHTML=rtime;		  
					    if(dstatus=='ON'){	  	   	 
	  	   	       document.getElementById(did).style.backgroundColor="#BBBBFF";
	  	        }else if (dstatus=='OFF'){
	  	   	       document.getElementById(did).style.backgroundColor="#F5F5F5";
	  	        }else{
	  	        	 document.getElementById(did).style.backgroundColor="#CCCCCC";
	  	        }				  
					  }			
				   }		
         } else { 
                //alert("processRequest() Error..");
         }
      } 
          
    }
	
	
    
	 function getStatusXML() {	 
        if (http_request.readyState == 4) { 
            if (http_request.status == 200) {
				var returnObj = http_request.responseXML;
				var xmlobj = http_request.responseXML;
				var doors = xmlobj.getElementsByTagName("door");
				var poweruser = document.getElementById('ps').getAttribute('poweruser'); 	
				
				
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
					  var classroom=door.getElementsByTagName("classroom")[0].firstChild.data;
					  var readerId=door.getElementsByTagName("readerId")[0].firstChild.data;
					  var powercontroller=door.getElementsByTagName("powercontroller")[0].firstChild.data;
					  var powercontrollerIP=door.getElementsByTagName("powercontrollerIP")[0].firstChild.data;
					  var classroomGroup=door.getElementsByTagName("classroomGroup")[0].firstChild.data;
					  var information=door.getElementsByTagName("information")[0].firstChild.data;
					  var state=door.getElementsByTagName("state")[0].firstChild.data;
					  var stateId=door.getElementsByTagName("stateId")[0].firstChild.data;						  
					  var devicestatus=eval('document.all.devicestatus'+did);					  				  
					  var obj=document.getElementById(did);
					  
					   if(obj!=null){
					   					
					   	/*						   	
					   	 if(dstatus=='OFF'){				   	 	 
					   	 	 devicestatus.src='images/driveOff.png';					   	 
					   	 }else{					   		 
					   		 devicestatus.src='images/driveON.png';					   	
					   	 } 	
					   	*/ 
					   	 		
				       var time=eval('document.all.time'+did);
				       time.innerHTML=rtime;
				       		       
				       var dtemp=eval('document.all.dinlettemp'+did);
				       dtemp.innerHTML=inlettemp+'℃';
				       
				 
				 
				       //未開啟	#F5F5F5				       
				       document.getElementById('tda'+did).style.backgroundColor=state;
				       document.getElementById('tdc'+did).style.backgroundColor=state;
				       
				       if(dstatus=='ON'){				
				       	 devicestatus.src='images/driveON.png';       	  
				         document.getElementById('tdb'+did).style.backgroundColor=state;
				         document.getElementById('tdd'+did).style.backgroundColor=state;
				       }else{ 
				       	 devicestatus.src='images/driveOff.png';				       	 
				       	 document.getElementById('tdb'+did).style.backgroundColor='#F5F5F5';
				         document.getElementById('tdd'+did).style.backgroundColor='#F5F5F5';
				       }
				       
				       
				       
				       //設備屬性
				       var attr='',attr1='';					
				       
				       if( poweruser.indexOf('PowerAdmin')!=-1)
				       {       			       
				        attr+='<image src="images/setting-icon.png"/> &nbsp; <a href="editReader1.html?reader.id='+did+'" target="_blank"><font color="White">設定課表排程冷氣權限</font></a>';
				        attr+='<hr>';				       				       				       
				       }

				       attr+='G50 Server 名稱 :'+decodeURIComponent(powercontroller)+'<BR>';	
				       attr+='G50 Server IP :'+powercontrollerIP+'<BR>';       
				       attr+='空調面版台號:'+readerId+'<BR>';
				       attr+='[課表排程] 設定溫度:'+settemp+'℃<BR>';
				       attr+='[課表排程] 是否開啟:'+dstatus+'<BR>';
				       attr+='[課表排程] 冷氣模式:'+decodeURIComponent(setting_mode)+'<BR>';
				       attr+='[課表排程] 准許手動控制開關:'+decodeURIComponent(setting_driveItem)+'<BR>';				      
				       attr+='[課表排程] 准許手動更改冷氣模式:'+decodeURIComponent(setting_modeItem)+'<BR>';
				       
				       var setting=eval('document.all.setting'+did);
				       setting.innerHTML=attr;				       
				       
				       //info
				       var infors=eval('document.all.info'+did);					     	     
				       infors.innerHTML=decodeURIComponent(information);
				       
				       //schedule
				       var schedule=eval('document.all.schedule'+did);
				       var scheduleDaily="scheduleDaily.html?reader.id="+did+"&classroomId="+classroom;
				       var scheduleWeekly="scheduleWeekly.html?readerId="+did+"&classroomId="+classroom;
				       var scheduleDaily1="scheduleDaily1.html?reader.id="+did+"&classroomId="+classroom;
				       var scheduleDaily2="scheduleDaily2.html?reader.id="+did+"&classroomId="+classroom;
				       
				       attr1+="<a href="+scheduleWeekly+" target='_blank'><font color='white'>課表排程</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily+" target='_blank'><font color='white'>手動排程(時間)</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily1+" target='_blank'><font color='white'>手動排程(節次)</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily2+" target='_blank'><font color='white'>手動排程(即時)</font></a>";
				       attr1+="<p>";				       
				       schedule.innerHTML=attr1;	
				       
				       if( poweruser.indexOf('PowerViewer')!=-1)
				       {
				       	 var settingICON=eval('document.all.settingICON'+did);
				       	 settingICON.style.display = "none";
				       	 var scheduleICON=eval('document.all.scheduleICON'+did);
				       	 scheduleICON.style.display = "none";
				       	 var activeICON=eval('document.all.activeICON'+did);
				       	 activeICON.style.display = "none";
				       	 
				       	 var ONICON=eval('document.all.ON'+did);
				       	 ONICON.style.display = "none";
				       	 var OFFICON=eval('document.all.OFF'+did);
				       	 OFFICON.style.display = "none";
				       }
				       
				     		       
					   }						   			   
				   }				
				  
            } else { 
                //alert("processRequest() Error..");
            }
        }
    }
    
    
    
    
    	 function getHoneyWellStatusXML() {	 
        if (http_request2.readyState == 4) { 
            if (http_request2.status == 200) {
				var returnObj = http_request2.responseXML;
				var xmlobj = http_request2.responseXML;
				var doors = xmlobj.getElementsByTagName("door");	
				var poweruser = document.getElementById('ps').getAttribute('poweruser');			
				for(var i=0;i<doors.length;i++) { 
					  var door = doors[i];					  
					  var did=door.getAttribute("id");						  		
					  var dstatus=door.getElementsByTagName("status")[0].firstChild.data;
					  var rtime=door.getElementsByTagName("time")[0].firstChild.data;					  
					  var settemp=door.getElementsByTagName("settemp")[0].firstChild.data;
					  var inlettemp=door.getElementsByTagName("inlettemp")[0].firstChild.data;	
					  var classroom=door.getElementsByTagName("classroom")[0].firstChild.data;
					  var powercontroller=door.getElementsByTagName("powercontroller")[0].firstChild.data;
					  var powercontrollerIP=door.getElementsByTagName("powercontrollerIP")[0].firstChild.data;
					  var lock=door.getElementsByTagName("lock")[0].firstChild.data;
					  var lockId=door.getElementsByTagName("lockId")[0].firstChild.data;					  
					  var readerId=door.getElementsByTagName("readerId")[0].firstChild.data;
					  var information=door.getElementsByTagName("information")[0].firstChild.data;
					  var state=door.getElementsByTagName("state")[0].firstChild.data;
					  var devicestatus=eval('document.all.devicestatus'+did);		
					  var lockstatus=eval('document.all.lockstatus'+did);					  		  
					  var obj=document.getElementById(did);
					  
					   if(obj!=null){
					   	  //alert("dstatus="+dstatus+"--rtime="+rtime+"--settemp="+settemp+"--inlettemp="+inlettemp);
				       var attr='',attr1='';	
				       
				       //info
				       var infors=eval('document.all.info'+did);					     	     
				       infors.innerHTML=decodeURIComponent(information);
				       
				       var inlettempObj=eval('document.all.dinlettemp'+did);
				       inlettempObj.innerHTML=inlettemp+'℃';	
				      
				       var time=eval('document.all.time'+did);
				       time.innerHTML=rtime; 
				        
				       var setting=eval('document.all.setting'+did);
				       
				       if( poweruser.indexOf('PowerAdmin')!=-1)
				       {       			       
				        attr+='<image src="images/setting-icon.png"/> &nbsp; <a href="editReader1.html?reader.id='+did+'" target="_blank"><font color="White">設定課表排程冷氣權限</font></a>';
				        attr+='<hr>';				       				       				       
				       }
				       
				       attr+='HoneyWell Server 名稱 :'+decodeURIComponent(powercontroller)+'<BR>';	
				       attr+='HoneyWell Server IP :'+powercontrollerIP+'<BR>';       
				       attr+='空調面版台號:'+readerId+'<BR>';
				       attr+='設定溫度:'+settemp+'℃<BR>';
				       attr+='面版鎖定狀態:'+decodeURIComponent(lock)+'<BR>';
				          
				       setting.innerHTML=attr;
				       
				       if( poweruser.indexOf('PowerViewer')!=-1)
				       {
				       	 var settingICON=eval('document.all.settingICON'+did);
				       	 settingICON.style.display = "none";
				       	 var scheduleICON=eval('document.all.scheduleICON'+did);
				       	 scheduleICON.style.display = "none";
				       	 var activeICON=eval('document.all.activeICON'+did);
				       	 activeICON.style.display = "none";
				       	 
				       	 var ONICON=eval('document.all.ON'+did);
				       	 ONICON.style.display = "none";
				       	 var OFFICON=eval('document.all.OFF'+did);
				       	 OFFICON.style.display = "none";
				       }
				       
				       //schedule
				       var scheduleDaily="scheduleDaily.html?reader.id="+did+"&classroomId="+classroom;
				       var scheduleWeekly="scheduleWeekly.html?readerId="+did+"&classroomId="+classroom;
				       var scheduleDaily1="scheduleDaily1.html?reader.id="+did+"&classroomId="+classroom;
				       var scheduleDaily2="scheduleDaily2.html?reader.id="+did+"&classroomId="+classroom;
				       attr1+="<a href="+scheduleWeekly+" target='_blank'><font color='white'>課表排程</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily+" target='_blank'><font color='white'>手動排程(時間)</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily1+" target='_blank'><font color='white'>手動排程(節次)</font></a>";
				       attr1+="<p>";
				       var schedule=eval('document.all.schedule'+did);				       
				       schedule.innerHTML=attr1;	
				       
				       							       
				       if(lockId==1){
				       	lockstatus.style.display = "inline";
				       }else{
				       	lockstatus.style.display = "none";
				       }	 
				       
				       
				       //未開啟	#F5F5F5				       
				       document.getElementById('tda'+did).style.backgroundColor=state;
				       document.getElementById('tdc'+did).style.backgroundColor=state;
				       
				       //alert(dstatus);
				       if(dstatus=='ON'){				
				       	 devicestatus.src='images/driveON.png';       	  
				         document.getElementById('tdb'+did).style.backgroundColor=state;
				         document.getElementById('tdd'+did).style.backgroundColor=state;
				       }else{ 
				       	 devicestatus.src='images/driveOff.png';				       	 
				       	 document.getElementById('tdb'+did).style.backgroundColor='#F5F5F5';
				         document.getElementById('tdd'+did).style.backgroundColor='#F5F5F5';
				       }
				       
					   }						   			   
				   }				
				  
            } else { 
                //alert("processRequest() Error..");
            }
        }
    }
    


//DEM510C
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
		//http_request3.open("GET", urls, true);
		http_request3.open("GET", urls + '?_=' + Math.random(), true);
		http_request3.send(null);
	}
	
	
function getDEM510CStatusXML() {	 
        if (http_request3.readyState == 4) { 
            if (http_request3.status == 200) {
				var returnObj = http_request3.responseXML;
				var xmlobj = http_request3.responseXML;
				var doors = xmlobj.getElementsByTagName("door");	
				var poweruser = document.getElementById('ps').getAttribute('poweruser');			
				for(var i=0;i<doors.length;i++) { 
					  var door = doors[i];					  
					  var did=door.getAttribute("id");						  		
					  var dstatus=door.getElementsByTagName("status")[0].firstChild.data;
					  var rtime=door.getElementsByTagName("time")[0].firstChild.data;					  
					  var classroom=door.getElementsByTagName("classroom")[0].firstChild.data;
					  var powercontroller=door.getElementsByTagName("powercontroller")[0].firstChild.data;
					  var powercontrollerIP=door.getElementsByTagName("powercontrollerIP")[0].firstChild.data;
					  var readerId=door.getElementsByTagName("readerId")[0].firstChild.data;
					  var state=door.getElementsByTagName("state")[0].firstChild.data;
					  var devicestatus=eval('document.all.devicestatus'+did);		
					  var obj=document.getElementById(did);
					  
					   if(obj!=null){
					   	  //alert("dstatus="+dstatus+"--rtime="+rtime+"--settemp="+settemp+"--inlettemp="+inlettemp);
				       var attr='',attr1='';				       
				      
				       var time=eval('document.all.time'+did);
				       time.innerHTML=rtime; 
				        
				       var setting=eval('document.all.setting'+did);
				       
				       if( poweruser.indexOf('PowerAdmin')!=-1)
				       {       			       
				        attr+='<image src="images/setting-icon.png"/> &nbsp; <a href="editReader1.html?reader.id='+did+'" target="_blank"><font color="White">設定課表排程冷氣權限</font></a>';
				        attr+='<hr>';				       				       				       
				       }
				       
				       attr+='DEM510C Server 名稱 :'+decodeURIComponent(powercontroller)+'<BR>';	
				       attr+='DEM510C Server IP :'+powercontrollerIP+'<BR>';       
				       attr+='空調面版台號:'+readerId+'<BR>';				          
				       setting.innerHTML=attr;
				       
				       if( poweruser.indexOf('PowerViewer')!=-1)
				       {
				       	 var settingICON=eval('document.all.settingICON'+did);
				       	 settingICON.style.display = "none";
				       	 var scheduleICON=eval('document.all.scheduleICON'+did);
				       	 scheduleICON.style.display = "none";
				       	 var activeICON=eval('document.all.activeICON'+did);
				       	 activeICON.style.display = "none";
				       	 
				       	 var ONICON=eval('document.all.ON'+did);
				       	 ONICON.style.display = "none";
				       	 var OFFICON=eval('document.all.OFF'+did);
				       	 OFFICON.style.display = "none";
				       }
				       
				       //schedule
				       var scheduleDaily="scheduleDaily.html?reader.id="+did+"&classroomId="+classroom;
				       var scheduleWeekly="scheduleWeekly.html?readerId="+did+"&classroomId="+classroom;
				       var scheduleDaily1="scheduleDaily1.html?reader.id="+did+"&classroomId="+classroom;
				       var scheduleDaily2="scheduleDaily2.html?reader.id="+did+"&classroomId="+classroom;
				       attr1+="<a href="+scheduleWeekly+" target='_blank'><font color='white'>課表排程</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily+" target='_blank'><font color='white'>手動排程(時間)</font></a>";
				       attr1+="<p>";
				       attr1+="<a href="+scheduleDaily1+" target='_blank'><font color='white'>手動排程(節次)</font></a>";
				       attr1+="<p>";
				       var schedule=eval('document.all.schedule'+did);				       
				       schedule.innerHTML=attr1;	
				       
				     
				       //未開啟	#F5F5F5				       
				        document.getElementById('tda'+did).style.backgroundColor=state;
				       document.getElementById('tdc'+did).style.backgroundColor=state;
				       
				       //alert(dstatus);
				       if(dstatus=='ON'){				
				       	 devicestatus.src='images/driveON.png';       	  
				         document.getElementById('tdb'+did).style.backgroundColor=state;
				         document.getElementById('tdd'+did).style.backgroundColor=state;
				       }else{ 
				       	 devicestatus.src='images/driveOff.png';				       	 
				       	 document.getElementById('tdb'+did).style.backgroundColor='#F5F5F5';
				         document.getElementById('tdd'+did).style.backgroundColor='#F5F5F5';
				       }
				       
					   }						   			   
				   }				
				  
            } else { 
                //alert("processRequest() Error..");
            }
        }
    }	