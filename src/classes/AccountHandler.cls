//public  class AccountHandler {
//    public static Account insertNewAccount(String name) {
//        try {
//        	Account acct = new Account(Name=name);
//            insert acct;
//        } catch (DmlException e) {
//            System.debug('A DML exception has occurred: ' +
//                e.getMessage());
//            return null;
//        }
//        return acct;
//    }
// }
// 

public  class AccountHandler {

    public static Account insertNewAccount(String name) {

        Account acct = new Account(Name=name);

        try {
            insert acct;

        } catch (DMLException e){
            return null;
        }

        return acct;
    }
}