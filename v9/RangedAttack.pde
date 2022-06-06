class RangedAttack{
  int dx;
  int x;
  int y;
  
  public RangedAttack(int a, int b, boolean c){
    x = a;
    y = b;
    if (c){
      dx = 5;
    }
    else{
      dx = -5;
    }
  }
}
