public class PackageExtension {


    public Mail__c selPackage {get; set; }
    public String specificId {get; set; }
    public String errorMessage {get; set; }
   

    public PackageExtension(ApexPages.StandardController sc) {
        this.specificId = ApexPages.currentPage().getParameters().get('recordID');
        if(this.specificId != '' && ApexPages.currentPage().getUrl().contains(Page.CustomSearchPackageView.getUrl())) {
            CustomSearch();
        }else if(ApexPages.currentPage().getUrl().contains(Page.CustomSearchPackageView.getUrl())) {
            this.errorMessage = 'Search must contain tracking id';
        }
    }
    
    public PageReference redirect() {
        PageReference result = Page.CustomSearchPackageView;
        result.getParameters().put('recordID', specificId);
        result.setRedirect(true);
        return result;
    }
    
    public void CustomSearch() {
        if(this.specificId == '') {
            this.errorMessage = 'Search must contain tracking id';
            this.selPackage = new Mail__c();
            return;
        }
        try {
            String fieldList = 'Id, Name, Delivered__c, Insurance__c, Missing__c, ' +
                			   'Value__c, Weight__c, Width__c, Height__c, ' + 
                			   'Mailing_Address__c, Addressed_To__c';
            String queryString = 'SELECT ' + fieldList + ' FROM Mail__c';
            String n = this.specificId;
            if(this.specificId != null) {
                queryString += ' WHERE Id=:n';
            }
            
            this.selPackage = Database.query(queryString);
            this.errorMessage = null;
        } catch(Exception e) {
            this.errorMessage = 'Failed to find package.';
			this.selPackage = new Mail__c();
        }
    }

    public Pagereference redirectList() {
        return Page.MailList;
    }
}