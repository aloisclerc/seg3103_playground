import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.LinkedList;
import java.util.List;

@RunWith(Parameterized.class)
public class DateNextDateOkTest
{
    private Date d;
    private Date e;

    public DateNextDateOkTest(Date d, Date e)
    {
        this.d = d;
        this.e = e;
    }

    @Parameterized.Parameters
    public static List<Date[]> data( )
    {
        List<Date[]> params = new LinkedList<Date[]>( );
        Date temp = new Date(2020,5,4);
        Date tempExpect = new Date(2020,5,5);
        params.add(new Date[] { temp,  tempExpect});
        temp = new Date(2020,2,28);
        tempExpect = new Date(2020,2,29);
        params.add(new Date[] { temp,  tempExpect});
        temp = new Date(2019,2,28);
        tempExpect = new Date(2019,3,1);
        params.add(new Date[] { temp,  tempExpect});
        temp = new Date(1900,2,28);
        tempExpect = new Date(1900,3,1);
        params.add(new Date[] { temp,  tempExpect});
        return params;
    }

    @Test
    public void testNextDate()
    {
        Date actualDate = d.nextDate();
        Assert.assertEquals(e, actualDate);
    }

}