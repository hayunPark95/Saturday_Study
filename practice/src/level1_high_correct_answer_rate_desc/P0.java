package level1_high_correct_answer_rate_desc;
//짝수와 홀수
public class P0 {
    public String solution(int num) {
        String answer = "";
        
        if(num%2==0){
            answer = "Even";
        } else {
            answer = "Odd";
        }
        return answer;
    }
}