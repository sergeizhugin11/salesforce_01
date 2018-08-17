public class ApexTableController {
	public List<Product_Table__c> results;

    public ApexTableController() {
    	this.results = 
            Database.query(
        	'SELECT Image_Url__c, Name, Product_Description__c, Unit_Price__c ' +
        	'FROM Product_Table__c ' +
        	'LIMIT 10'
    	);
	}
    	public List<Product_Table__c> getProductTable() {
        return results;
    }
}