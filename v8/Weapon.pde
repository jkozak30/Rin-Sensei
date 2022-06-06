class Weapon {
  int type;
  int attack;
  PImage img;
  int xOff;
  PImage ptr = loadImage("pointer.png");
  boolean selected = false;
  
  
  public Weapon(PImage i, int atk, int x) {
    attack = atk;
    img = i;
    xOff = x;
    type = 0;
  }
  
  void draw() {
    /*image(img, p.x+xOff, p.y-20);*/
  }
  
  void drawShop(int x, int y) {
    image(img, x, y);
    if (abs(p.x - x) <= 10) {selected = true; image(ptr, x+10, y-10);}
    else {selected = false; }
  }
}
