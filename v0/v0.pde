Maze m;

void setup() {
  size(300, 300);
  m = new Maze(10, 10);
  m.mazeify();
}

void draw() {
  m.draw();
}
