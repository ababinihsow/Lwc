global class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful{
    public LeadProcessor() {

    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        String leadSqlStr = 'SELECT LeadSource,Id FROM Lead';
        return Database.getQueryLocator(leadSqlStr);
    }

    global void execute(Database.BatchableContext BC,List<Lead> scope) {
        List<Lead> toUpdateLeads = new List<Lead>();
        for (Lead le : scope) {
            le.LeadSource = 'Dreamforce';
            toUpdateLeads.add(le);
        }
        if (toUpdateLeads.size() > 0) {
            Update toUpdateLeads;
        }
    }

    global void finish(Database.BatchableContext BC) {
        
    }
}
