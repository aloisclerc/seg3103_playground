import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class FizzbuzzTest {
    @Test
    public void fizzbuzzTest() {
        Fizzbuzz f = new Fizzbuzz();
        assertEquals("Fizz", f.fizzbuzz(6));
        assertEquals("Buzz", f.fizzbuzz(20));
        assertEquals("FizzBuzz", f.fizzbuzz(15));
    }

    @Test
    public void hundredTest() {
        Fizzbuzz f = new Fizzbuzz();
        var exp = new String[]{"FizzBuzz", "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz", "31", "32", "Fizz", "34", "Buzz", "Fizz", "37", "38", "Fizz", "Buzz", "41", "Fizz", "43", "44", "FizzBuzz", "46", "47", "Fizz", "49", "Buzz", "Fizz", "52", "53", "Fizz", "Buzz", "56", "Fizz", "58", "59", "FizzBuzz", "61", "62", "Fizz", "64", "Buzz", "Fizz", "67", "68", "Fizz", "Buzz", "71", "Fizz", "73", "74", "FizzBuzz", "76", "77", "Fizz", "79", "Buzz", "Fizz", "82", "83", "Fizz", "Buzz", "86", "Fizz", "88", "89", "FizzBuzz", "91", "92", "Fizz", "94", "Buzz", "Fizz", "97", "98", "Fizz"};
        var act =  f.fizzbuzz();
        for(int i = 0; i < exp.length; i++){
            assertEquals(exp[i], act[i]);
        }

    }
    @Test
    public void twoNumTest(){
        Fizzbuzz f = new Fizzbuzz();
        var exp = new String[]{"1","2","Fizz","4","Buzz"};
        var act =  f.fizzbuzz(1,5);
        for(int i = 0; i <= 4; i++){
            assertEquals(exp[i], act[i]);
        }
        exp = new String[]{"14","FizzBuzz","16"};
        act =  f.fizzbuzz(14,16);
        for(int i = 0; i <= 2; i++){
            assertEquals(exp[i], act[i]);
        }
    }


}
