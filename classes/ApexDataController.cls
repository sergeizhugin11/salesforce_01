public class ApexDataController {
    public Id qp;
    public Product_Table__c result;

    public ApexDataController() {
    	this.qp = ApexPages.currentPage().getParameters().get('parm_01');
        this.result = 
            Database.query(
        	'SELECT Image_Url__c, Name, Product_Description__c, Unit_Price__c, Units_Available__c ' +
        	'FROM Product_Table__c ' +
        	'WHERE Id = :qp'
                );
	}

	public Product_Table__c getMessage() {
        return result;
    }
}