public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        List<Contact> contacts = new List<Contact>();
        
        for(Integer i=0;i<numContacts;i++) {
            Contact c = new Contact(FirstName='TestContact ' + i, 
                                    LastName=lastName);
            contacts.add(c);
        }
		return contacts;
    }
}