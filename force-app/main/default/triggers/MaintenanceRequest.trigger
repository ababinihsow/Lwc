trigger MaintenanceRequest on Case (after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
    List<Case> toSetCase = new List<Case>();
    for (Case closeCase : (List<Case>)Trigger.new) {
        if ((closeCase.Type == 'Repair' || closeCase.Type == 'Routine Maintenance') && closeCase.Status == 'Closed') {
            toSetCase.add(closeCase);
        }
    }
    MaintenanceRequestHelper.updateWorkOrders(toSetCase);
}