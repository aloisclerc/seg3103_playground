public class Fizzbuzz {

    public static void main(String[] args) {
        Fizzbuzz f = new Fizzbuzz();
        f.fizzbuzz();
    }
    public void print_fizzbuzz(){
        String[] temp = new String[100];
        for(int i = 0; i < 100; i++){
            temp[i] = fizzbuzz(i);
            System.out.println(temp[i]);
        }
    }
    public String[] fizzbuzz(){
        String[] temp = new String[100];
        for(int i = 0; i < 100; i++){
            temp[i] = fizzbuzz(i);
        }
        return temp;
    }
    public String fizzbuzz(int num) {
        if (num % 3 == 0 && num % 5 == 0) {
            return "FizzBuzz";
        } else if (num % 3 == 0) {
            return "Fizz";
        } else if (num % 5 == 0) {
            return "Buzz";
        } else {
            return num + "";
        }
    }
    public String[] fizzbuzz(int num, int num2){
        String[] temp = new String[num2-num+1];
        int j = num;
        for(int i = 0; i <= num2-num; i++){
            temp[i] = fizzbuzz(j);
            j++;
        }
        return temp;
    }

}
