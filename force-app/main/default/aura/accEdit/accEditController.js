({
    handleSaveRecord: function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                var errMag = '';
                for (let i = 0; i < saveResult.error.length; i++) {
                    errMag += saveResult.error[i];
                    
                }
                component.set('v.recordSaveError',errMag);
            } else {
                component.set('v.recordSaveError','');
            }
        }));}
})