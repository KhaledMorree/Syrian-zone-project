
class calculateBrain{
  calculateBrain({required this.amount, required this.result});

final String  amount;
double result;
 String getPris(){
  String result= amount;
  return result.toString();

}
  String getResult(){
  if(result==2){
    return '2';
  }
  else if(result==4.5){
    return '4.5';
  }else if (result==6){
    return  '6';
  }
  else {
    return '8.5';
  }
  }


}