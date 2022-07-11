public class searchFSLIcontroller {
    String searchText;
    List<FSLI__c> results;

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String s) {
        searchText = s;
    }

    public List<FSLI__c> getResults() {
        return results;
    }

    public PageReference doSearch() {
        results = (List<FSLI__c>)[FIND :searchText RETURNING FSLI__c(Name, Scope__c, IsDeleted__c)][0];
        return null;
    }

}