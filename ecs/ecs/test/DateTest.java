import org.junit.jupiter.api.Test;

class DateTest {

  @Test
  void nextDate_sample() {
    Date d = new Date(2020,5,3);
    assertEquals(new Date(2020,5,4), d.nextDate());
  }
  @Test
  void isLeapYear_sample() {
    Date d = new Date(2000,2,29);
    assertEquals(true, d.isLeapYear());
    Date e = new Date(2019,2,28);
    assertEquals(false, e.isLeapYear());
  }
  @Test
  void toString_sample() {
    Date d = new Date(2020,2,29);
    assertEquals("2020/February/29", d.toString());
  }

  @Test
  void equals_sample() {
    Date d = new Date(2020,2,28);
    Date f = new Date(2020,2,28);
    assertEquals(true, d.equals(f));
    Date e = new Date(2020,1,29);
    assertEquals(false, d.equals(e));

  }


}