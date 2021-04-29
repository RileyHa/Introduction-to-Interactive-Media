public class Score {
  
  int value;
  
  Score() {  
  value = 0;  
  }
  
  void add() {
    value++;
  }

  void count(String input, int val){
    for (int i = 0; i<11; i++){
      if (troy[i] == input){
        scoreTroy.append(val);
      }
      else if(gabriella[i] == input){
        scoreGabriella.append(val);
      }
      else if(sharpay[i] == input){
        scoreSharpay.append(val);
      }
      else if(ryan[i] == input){
        scoreRyan.append(val);
      }
      else if(taylor[i] == input){
        scoreTaylor.append(val);
      }
      else if(chad[i] == input){
        scoreChad.append(val);
      }
    }
  }
  
  /*
  */
}
