package level1_java_high_correct_answer_rate_desc;
//평균 구하기
public class P4 {
    public double solution(int[] arr) {
        double answer = 0;
        double tot=0;
        
        for(int i:arr) {
        	tot+=i;
        	answer=tot/(arr.length);
        }
        
        return answer;
    }
}