package practice;

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