class Weapon {
  int attack;
  PImage img;
  int xOff;
  
  Weapon(PImage i, int atk, int x) {
    attack = atk;
    img = i;
    xOff = x;
  }
  
  void draw(Player p) {
    image(img, p.x+xOff, p.y-20);
  }
}
