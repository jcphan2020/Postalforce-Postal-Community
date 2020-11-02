public class MailControllerExtension {
    //constructor
    public MailControllerExtension(ApexPages.StandardSetController sc){
        
    }
    
    //Define our variables
    public List<Mail__c> mailList{get;set;}
    public String statusOptions{get;set;}

    public String recordID {get; set; }


    //Get In transit, Delivered, or All packages
    public void getMail() {
        if(StatusOptions == 'In Transit'){
            mailList = new List<Mail__c>([SELECT Id, Inhabitant__c, Mailing_Address__c, Insurance__c, Value__c, Delivered__c FROM Mail__c WHERE Delivered__c = false AND OwnerID=:userInfo.getUserId()]);
        }else if(statusOptions == 'Delivered'){
            mailList = new List<Mail__c>([SELECT Id, Inhabitant__c, Mailing_Address__c, Insurance__c, Value__c, Delivered__c FROM Mail__c WHERE Delivered__c = true AND OwnerID=:userInfo.getUserId()]);
        }else{
            mailList = new List<Mail__c>([SELECT Id, Inhabitant__c, Mailing_Address__c, Insurance__c, Value__c, Delivered__c FROM Mail__c WHERE OwnerID=:userInfo.getUserId()]);
        }    
    }

    public PageReference redirect() {
        PageReference result = Page.CustomSearchPackageView;
        result.getParameters().put('recordID', recordID);
        result.setRedirect(true);
        return result;
    }

    //Redirect to Custom Search Package View page
    public Pagereference redirectSearchPage() {
        return Page.CustomSearchPackageView;
    }
}