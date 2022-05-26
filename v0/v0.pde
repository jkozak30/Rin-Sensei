Maze m;

void setup() {
  size(300, 300);
  m = new Maze(6, 6);
  m.mazeify();
  //System.out.println(m.mazeString());
}

void draw() {
  m.draw();
}

void mousePressed() {
}

void keyPressed() {
}
