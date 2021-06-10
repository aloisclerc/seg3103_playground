import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class FizzbuzzTest {
    @Test
    public void fizzbuzzTest(){
        Fizzbuzz f = new Fizzbuzz();
        assertEquals("Fizz", f.fizzbuzz(6));
        assertEquals("Buzz", f.fizzbuzz(20));
        assertEquals("FizzBuzz", f.fizzbuzz(15));
    }

    
}
