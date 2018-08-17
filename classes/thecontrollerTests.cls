@isTest
public class thecontrollerTests {

   public static testMethod void testMyController_01() {
       /////////////////////////////////////////////
      	Warehouse__c ware = new Warehouse__c(Name='Samsung Galaxy S7');
       	insert ware;
		Product_Table__c test = new Product_Table__c(
            Image_Url__c= 'https://content2.onliner.by/catalog/device/header/897a990788ae36861359132882862801.jpeg',
            Name = 'Samsung Galaxy S7', 
            Product_Description__c = 'Android, экран 5.5" AMOLED (1440x2560), Exynos 8890, ОЗУ 4 ГБ, флэш-память 32 ГБ, карты памяти, камера 12 Мп, аккумулятор 3600 мАч, 1 SIM, цвет черный',
            Unit_Price__c = 800,
            Units_Available__c = 50,
            Warehouse__c = ware.Id
        );
       insert test;
       Product_Table__c prtb =[select id from Product_Table__c where  Name = 'Samsung Galaxy S7' ];
       ApexPages.currentPage().getParameters().put('parm_02', prtb.Id);
       /////////////////////////////
        ApexBuyController controller = new ApexBuyController();
 		controller.setLastName('lastname');
        controller.setFirstName('firstname');
      	controller.setEmail('firstlast@acme.com');
       	controller.setApexVar_02(12);
        controller.Saving();
 
        Contact leads = [SELECT LastName, Email FROM Contact where FirstName ='firstname']; 
        System.assertEquals('firstlast@acme.com', leads.Email); 
       	Order_Table__c ord = [SELECT Product__c, Units__c, Order_Amount__c FROM Order_Table__c where Contact__c = :leads.Id];
        System.assertEquals(prtb.Id, ord.Product__c); 

       
        controller = new ApexBuyController();
 		controller.setLastName('lastname_02');
        controller.setFirstName('firstname_02');
      	controller.setEmail('firstlast1@acme.com');
       	controller.setApexVar_02(60);
        controller.Saving();
       
 
       
       	controller = new ApexBuyController();
 		controller.setLastName('lastname_02');
        controller.setFirstName('firstname_02');
      	controller.setEmail('firstlast@acme.com');
       	controller.setApexVar_02(12);
        controller.Saving();
       

       
       	controller = new ApexBuyController();
 		controller.setLastName('lastname_02');
        controller.setFirstName('firstname_02');
      	controller.setEmail('firstlast@acme.com');
       	controller.setApexVar_02(60);
        controller.Saving();
       
 
 
        /*Contact leads_02 = [SELECT LastName, Email FROM Contact where FirstName ='firstname']
        System.assertEquals('firstlast@acme.com', leads_02.Email); 
       	Order_Table__c ord_02 = [SELECT Product__c, Units__c, Order_Amount__c FROM Order_Table__c where Contact__c = :leads_02.Id];
        System.assertEquals(prtb.Id, ord_02.Product__c); 
       
       	controller = new ApexBuyController();
 		controller.setLastName('lastname');
        controller.setFirstName('firstname');
      	controller.setEmail('firstlast@acme.com');
       	controller.setApexVar_02(60);
        controller.Saving();*/
 
    
    }
    public static testMethod void testMyController_02() {
        Warehouse__c ware = new Warehouse__c(Name='Samsung Galaxy S7');
       	insert ware;
		Product_Table__c test = new Product_Table__c(
            Image_Url__c= 'https://content2.onliner.by/catalog/device/header/897a990788ae36861359132882862801.jpeg',
            Name = 'Samsung Galaxy S7', 
            Product_Description__c = 'Android, экран 5.5" AMOLED (1440x2560), Exynos 8890, ОЗУ 4 ГБ, флэш-память 32 ГБ, карты памяти, камера 12 Мп, аккумулятор 3600 мАч, 1 SIM, цвет черный',
            Unit_Price__c = 800,
            Units_Available__c = 50,
            Warehouse__c = ware.Id
        );
       insert test;
       Product_Table__c prtb =[select id from Product_Table__c where  Name = 'Samsung Galaxy S7' ];
       ApexPages.currentPage().getParameters().put('parm_01', prtb.Id);
        ApexDataController controller = new ApexDataController();
       controller.getMessage(); 
        
    }
    public static testMethod void testMyController_03() {
        Warehouse__c ware = new Warehouse__c(Name='Samsung Galaxy S7');
       	insert ware;
		Product_Table__c test = new Product_Table__c(
            Image_Url__c= 'https://content2.onliner.by/catalog/device/header/897a990788ae36861359132882862801.jpeg',
            Name = 'Samsung Galaxy S7', 
            Product_Description__c = 'Android, экран 5.5" AMOLED (1440x2560), Exynos 8890, ОЗУ 4 ГБ, флэш-память 32 ГБ, карты памяти, камера 12 Мп, аккумулятор 3600 мАч, 1 SIM, цвет черный',
            Unit_Price__c = 800,
            Units_Available__c = 50,
            Warehouse__c = ware.Id
        );
       insert test;
 	ApexTableController controller = new ApexTableController();
	controller.getProductTable();
        
    }
}