public class StringArrayTest {
    public static String[] generateStringArray(Integer count) {
        List<String> strings = new List<String>();
        
        for(Integer i=0;i<count;i++) {
    		strings.add('Test ' + i);
		}
        
        return strings;
    }
}