import java.util.*;

class Maze {
  Square[][] grid;
  Square current;
  Stack<Square> stack;
  int numVisited;
  //int id; 
  
  
  public Maze(int rows, int cols) {
    grid = new Square[rows][cols];
    for (int r=0; r<rows; r++) {
      for (int c=0; c<cols; c++) {
        //id = 0;  
        Square temp; 
        if (r==0 && c==1) {temp = new HealingRoom(r, c);} //randomize later
        else if (r==1 && c==1) {temp = new BHRoom(r, c);} //randomize later
        else if (r==rows-1 && c==cols-1) {temp = new EndRoom(r, c); print("made");} //right corner square
        else {temp = new Square(r, c);}
        
        grid[r][c] = temp;
      }
    }
    //grid[0][0].ROOM_ID = 1;
    current = grid[0][0]; //it dont matter which one
    stack = new Stack<Square>();
    numVisited = 0;
  }
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  void draw() {
    strokeWeight(1);
    for(int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[0].length; c++) {
        grid[r][c].cDraw(p);
      }
    }
  }
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  public String mazeString() {
    String ret = "";
    for (int i=0; i<2*(2*grid[0].length+1); i++) {ret+="#";}
    ret += "\n";
    for (int r=0; r<grid.length; r++) {
      String row = "##";
      String below = "##";
      for (int c=0; c<grid[0].length; c++) {
        row += "  ";
        if (grid[r][c].walls[1] == true) row += "##";
        else row += "  ";
        if (grid[r][c].walls[2] == true) below += "##";
        else below += "  ";
        below += "##";
      }
      row += "\n";
      below += "\n";
      ret += row;
      ret += below;
    }
    return ret;
  }
  
  public void mazeify() {
    while (true) {
      current.isVisited = true;
      Square next = current.pickNeighbor(grid);
      if (next != null) {
        stack.push(current);
        merge(current, next);
        current = next;
      } else if (stack.size() > 0) {
        current = stack.pop();
      } else break;
    }
  }
  
  // assuming off by one
  public void merge(Square curr, Square nex) {
    int xdiff = nex.c - curr.c; //yes. final - init
    int ydiff = nex.r - curr.r;

    if (ydiff == -1) {
      curr.walls[0] = false;
      nex.walls[2] = false;
    } 
    if (xdiff == 1) {
      curr.walls[1] = false;
      nex.walls[3] = false;
    }
    if (ydiff == 1) {
      curr.walls[2] = false;
      nex.walls[0] = false;
    }
    if (xdiff == -1) {
      curr.walls[3] = false;
      nex.walls[1] = false;
    }
  }
  


}//end of class
