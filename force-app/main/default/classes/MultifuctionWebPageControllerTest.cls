@IsTest
public class MultifuctionWebPageControllerTest {
    public static testMethod void TestMWPC()
    {
        MultifunctionWebPageController mwpc =new MultifunctionWebPageController();
        mwpc.getmultifuctions();
        Id a=Null;
        MultifunctionWebPageController.SaveEmployee(a, 'Aakash Ghosh',1, 'email@gmail.com', '5/9/2017', 'Kolkata', '7797073789', '000','Male', 'xyz');
        //MultifunctionWebPageController.SaveEmployee(a, 'Aakash Ghosh',3, 'email@gmail.com', '5/9/2017', 'Kolkata', '7797073789', '000','Male', 'xyz');
        Multifuction__c multifuction=new Multifuction__c(Name='A');
        mwpc.individual();
        mwpc.save();
    }
}