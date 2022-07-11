public class RegistrationSiteController {
    public string username{get;set;}
    public string communityNickname{get;set;}
    public string email{get;set;}
    public string password{get;set;}
    public string confirmPassword{get;set;}
    
    static final Id accountId='001280000131RIOAA2';
    private boolean isValidPassword() {
        return password == confirmPassword;
    }
    public PageReference RegisterUserforSite()
    {    
        if (isValidPassword())
        {
            User u=new User();
            u.username=username;
            u.CommunityNickname=communityNickname;
            u.Email=email;
            //u.AccountId='001280000131RIOAA2';
            //system.setPassword(u.Id, password);
            
            system.debug(username);
            
            String userId = Site.createPortalUser(u, accountId, password);
            
            PageReference loginPage=System.Page.LoginSite;
            loginPage.setRedirect(true);
            return loginPage;
        }
        else
        {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'passwords_dont_match');
            ApexPages.addMessage(msg);
            return null;
        }
    }
    
    
}