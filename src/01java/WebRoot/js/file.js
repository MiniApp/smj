function getUnloadFilePath(obj1) { 
    if (obj1) { 
        //Internet Explorer  
        if (window.navigator.userAgent.indexOf("MSIE") >= 1) { 
            obj1.select(); 
            return document.selection.createRange().text; 
        }  

        //Firefox 
        else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {  
            if (obj1.files) { 
               if(window.navigator.appVersion == "5.0 (Windows)")
              {
                        return window.URL.createObjectURL(obj1.files[0]);
                        
               }
               else 
 	       {
                        return  obj1.files.item(0).getAsDataURL();               
	       }
            } 
            return  obj1.value; 
        }  
        return obj1.value; 
    }  
}