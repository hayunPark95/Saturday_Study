package level1_java_high_correct_answer_rate_desc;

//자릿수더하기

public class P2 {
    public int solution(int n) {
        int answer = 0;
        String ans = Integer.toString(n);
        
        for(int i=0;i<ans.length();i++) {
        	answer += Integer.parseInt(ans.substring(i,i+1));
        }
        
        System.out.println(answer);

        return answer;
    }
}