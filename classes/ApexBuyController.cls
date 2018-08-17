public class ApexBuyController {
    
	public String firstName;
    public String lastName;
    public String email;
    public Id qp;
    public Decimal ApexVar_02;
    public Product_Table__c result;

    public ApexBuyController() {
    	this.qp = ApexPages.currentPage().getParameters().get('parm_02');
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
    
    public String getFirstName() {
    	return this.firstName;
    }
 
    public void setFirstName(String firstName) {
    	this.firstName = firstName;
    }

    public String getLastName() {
    	return this.lastName;
    }
 
    public void setLastName(String lastName) {
    	this.lastName = lastName;
    }

    public String getEmail() {
    	return this.email;
    }
 
    public void setEmail(String email) {
    	this.email = email;
    }

    public Decimal getApexVar_02() {
        return apexVar_02;  
    }
    
    public void setApexVar_02(Decimal apexVar_02) {
        this.apexVar_02 = apexVar_02;
    }
    
   	public PageReference Saving() {
                        if(!([SELECT FirstName,LastName FROM Contact WHERE Email = :this.Email].isEmpty())){
                            Contact cont_01 = [SELECT FirstName,LastName FROM Contact WHERE Email = :this.Email];
                            cont_01.FirstName=this.FirstName;
                            cont_01.LastName=this.LastName;
                			upsert cont_01;
                            Order_Table__c Ord_01 = new Order_Table__c();
                            Ord_01.Product__c = result.Id;
                            Ord_01.Units__c = apexVar_02;
                            Ord_01.Order_Amount__c = apexVar_02*result.Unit_Price__c;
                            Ord_01.Contact__c = cont_01.Id;
                            if( result.Units_Available__c - Ord_01.Units__c >= 0) {
                                result.Units_Available__c = result.Units_Available__c - Ord_01.Units__c;
                           
                                upsert result;
                                insert Ord_01;
                                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Purchase completed successfully'));
                            }
                            else {
                                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Purchase completed is not successfully'));
                            }
                        }
                        else {
                            Contact cont_02 = new contact();
                            cont_02.FirstName=this.FirstName;
                            cont_02.LastName=this.LastName;
                            cont_02.Email=this.Email;
                    		insert cont_02;
                            Order_Table__c Ord_01 = new Order_Table__c();
                            Ord_01.Product__c = result.Id;
                            Ord_01.Units__c = apexVar_02;
                            Ord_01.Order_Amount__c = apexVar_02 * result.Unit_Price__c;
                            Ord_01.Contact__c = cont_02.Id;
                            if( result.Units_Available__c - Ord_01.Units__c >= 0) {
                                result.Units_Available__c = result.Units_Available__c - Ord_01.Units__c;
                                
                                upsert result;
                                insert Ord_01;
                                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Purchase completed successfully'));
                            }
                            else {
                                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Sorry, this product is out of stock'));
                            }
                        }                          
                return null;
    }
}