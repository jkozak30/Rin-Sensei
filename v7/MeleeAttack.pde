class MeleeAttack{
  int xFront;
  int xBack;
  int yTop;
  int yBottom;
  int t = 0;
  

  public MeleeAttack(int a, int b, int c, int d){
    xFront = a;
    xBack = b;
    yTop = c;
    yBottom = d;
  }
  
  void draw(){
    t++;
  }
}
