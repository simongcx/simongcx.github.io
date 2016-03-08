var eventmanager = {
    
    eventdata : {},
    
    registerevent : function (eventname, func) {
        
        if (this.eventdata.hasOwnProperty(eventname)) {
            this.eventdata[eventname].push(func);
        }
        else {
            this.eventdata[eventname] = [func];
        }

    },
    
    triggerevent : function (eventname, params) {
        
        if (this.eventdata.hasOwnProperty(eventname)) {
            for (var i = 0; i < this.eventdata[eventname].length; i++) {
                this.eventdata[eventname][i](params);
            }
        }        
    },
    
    deregisterevent : function (eventname, func) {
        
        if (this.eventdata.hasOwnProperty(eventname)) {
            for (var i = this.eventdata[eventname].length - 1; i >= 0 ; i--) {
                if (this.eventdata[eventname][i] === func) {
                    this.eventdata[eventname].splice(i, 1);
                }
            }
        }    
        
    }
};



// test cases

object1 = {
    
    method1 : function() {
        console.log("hello");
    },

    method2 : function(params) {
        console.log(params);
    }
  
};


eventmanager.registerevent("hello", object1.method1);
eventmanager.triggerevent("hello");

eventmanager.deregisterevent("hello", object1.method1);
eventmanager.triggerevent("hello");

eventmanager.registerevent("event2", object1.method2);
eventmanager.triggerevent("event2",{prop1:"is a string"});
