Maze m;
Player p;

void setup() {
  size(300, 300);
  m = new Maze(6, 6);
  p = new Player(m.grid);
  m.mazeify();
  //System.out.println(m.mazeString());
}

void draw() {
  background(80, 100, 200);
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
}

void keyReleased() {
  if (key == 'w' || keyCode == UP) { p.dy = 0; }
  if (key == 'd' || keyCode == RIGHT) { p.dx = 0; }
  if (key == 's' || keyCode == DOWN) { p.dy = 0; }
  if (key == 'a' || keyCode == LEFT) { p.dx = 0; }
}
