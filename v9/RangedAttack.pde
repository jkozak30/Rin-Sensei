class RangedAttack{
  int dx;
  int x;
  int y;
  boolean right;
  
  public RangedAttack(int a, int b, boolean c){
    x = a;
    y = b;
    right = c;
    if (right){
      dx = 3;
    }
    else{
      dx = -3;
    }
  }
  
  void draw(){
    imageMode(CENTER);
    if (right){
      image(p.projectileRight, x, y);
    }
    else{
      image(p.projectileLeft, x, y);
    }
  }
  
  void update(){
    x+=dx;
  }
}
