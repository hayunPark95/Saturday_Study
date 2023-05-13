package level1_high_correct_answer_rate_desc;
//x만큼 간격이 있는 n개의 숫자
public class P1 {
    public long[] solution(int x, int n) {
        long[] answer = new long[n];
        
    	long tot=0;
    	for (int i = 0; i < n; i++) {
			answer[i] = x+tot;
			tot = tot+x;
		} 
        return answer;
    }
}