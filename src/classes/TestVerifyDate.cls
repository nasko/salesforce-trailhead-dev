@isTest
public class TestVerifyDate {
    @isTest static void testWithin30DaysPeriod() {
		Date date1 = System.today();
		Date date2 = date1.addDays(10);
		Date pickedDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(pickedDate, date2);
    }

    @isTest static void testBeyond30DaysPeriod() {
		Date date1 = System.today();
		Date date2 = date1.addDays(35);
		Date pickedDate = VerifyDate.CheckDates(date1, date2);
     	Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        System.assertEquals(pickedDate, lastDay);
    }
}