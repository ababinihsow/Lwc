public class AddPrimaryContact implements Queueable{
    public Contact con;
    public String st;
    public AddPrimaryContact(Contact con , String st) {
        this.con = con;
        this.st = st;
    }
    public void execute(QueueableContext context) {
        List<Account> accList = [SELECT BillingState,Id  FROM Account WHERE BillingState =: st LIMIT 200];
        List<Contact> toInsertCons = new List<Contact>();
        for (Account acc : accList) {
            Contact cloneCon = con.clone(false);
            cloneCon.AccountId = acc.Id;
            toInsertCons.add(cloneCon);
        }
        if (toInsertCons.size() > 0) {
            INSERT toInsertCons;
        }
    }
}
