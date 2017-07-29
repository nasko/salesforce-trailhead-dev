@isTest
public class TestRestrictContactByName {

    @isTest static void TestInvalidLastName() {
        Contact c = new Contact(FirstName='John',LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(c);
        Test.stopTest();
		
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }

    @isTest static void TestValidLastName() {
        Contact c = new Contact(FirstName='John',LastName='Dow');
        Test.startTest();
        Database.SaveResult result = Database.insert(c);
        Test.stopTest();
		
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
    }

    @isTest static void TestContactWithoutLastName() {
        Contact c = new Contact(FirstName='John');
        Test.startTest();
        Database.SaveResult result = Database.insert(c);
        Test.stopTest();
		
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        
        System.assertEquals('Required fields are missing: [LastName]',
                             result.getErrors()[0].getMessage());
    }
}