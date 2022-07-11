trigger insertMultifuctionTrigger on Multifuction__c (before insert) {
    
    for(Multifuction__c mf: Trigger.New)
    {
        if(mf.Name=='bad')
        {
            mf.Name.adderror('Please change the name');
        }
    }

}