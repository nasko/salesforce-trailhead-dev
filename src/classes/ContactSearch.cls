public class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String mpCode) {
        Contact[] cts = [SELECT ID, Name FROM Contact 
                 WHERE LastName = :lName AND MailingPostalCode = :mpCode];
        return cts;
    }
}