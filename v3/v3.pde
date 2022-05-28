Maze m;
Player p;
PImage bg; 
HealingRoom hl;
Weapon w;

void setup() {
  size(400, 400);
  m = new Maze(6, 6);
  w = new Weapon(loadImage("weapon.png"), 20);
  p = new Player(m.grid, w);
  m.mazeify();
  //System.out.println(m.mazeString());
  bg = loadImage("background.png");
  hl = new HealingRoom(); 
}

void draw() {
  //background(80, 100, 200);
  background(bg);
  p.update();
  p.draw();
  m.draw();
}

void mousePressed() {
}

void keyPressed() {
  if (key == 'w' || keyCode == UP) { p.dy = -3; /*p.y-=5;*/ }
  if (key == 'd' || keyCode == RIGHT) { p.dx = 3; }
  if (key == 's' || keyCode == DOWN) { p.dy = 3; }
  if (key == 'a' || keyCode == LEFT) { p.dx = -3; }
  if (key == ' ' && p.t > 30 ) { p.t = 0; }
}

void keyReleased() {
  if (key == 'w' || keyCode == UP) { p.dy = 0; }
  if (key == 'd' || keyCode == RIGHT) { p.dx = 0; }
  if (key == 's' || keyCode == DOWN) { p.dy = 0; }
  if (key == 'a' || keyCode == LEFT) { p.dx = 0; }
}
