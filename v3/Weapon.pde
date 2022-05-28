class Weapon {
  int attack;
  PImage img;
  
  Weapon(PImage i, int atk) {
    attack = atk;
    img = i;
  }
  
  void draw(Player p) {
    image(img, p.x+2, p.y-20);
  }
}
