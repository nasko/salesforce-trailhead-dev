public class ContactAndLeadSearch {
    public static List<List<SOBject>> searchContactsAndLeads(String searchValue) {
        List<List<sObject>> searchList = [FIND :searchValue IN NAME FIELDS 
                   RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
        return searchList;
    }
}