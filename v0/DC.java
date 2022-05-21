import java.util.*;

public class DC {

  Square[][] grid;
  Square current; //pointer
  Stack<Square> stack;
  int numVisited;


  public DC(int rows, int cols) {
    grid = new Square[rows][cols];
    for (int r=0; r<rows; r++) {
      for (int c=0; c<cols; c++) {
        Square temp = new Square(r, c);
        grid[r][c] = temp;
      }
    }
    current = grid[0][0]; //it dont matter which one
    stack = new Stack<>();
    numVisited = 0;
  }

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
      Square next = current.pickNeighbor();
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

  public static void main(String[] args) {
    DC siu = new DC(20, 10);
    System.out.println(siu.mazeString());
    siu.mazeify();
    System.out.println(siu.mazeString());
  }



  class Square {
    int r, c;
    //Square[] neighbors;
    boolean isVisited;
    boolean[] walls = { true, true, true, true }; //cw from top

    public Square(int r, int c) {
      this.r = r;
      this.c = c;
      isVisited = false;
    }

    // returns random neighbor of this sq if one exists
    // else returns null
    public Square pickNeighbor() {
      ArrayList<Square> neighbors = new ArrayList<>();
      if (this.r > 0 && grid[r-1][c].isVisited == false) { neighbors.add(grid[r-1][c]); }
      if (this.c < grid[0].length-1 && grid[r][c+1].isVisited == false) { neighbors.add(grid[r][c+1]); }
      if (this.r < grid.length-1 && grid[r+1][c].isVisited == false) { neighbors.add(grid[r+1][c]); }
      if (this.c > 0 && grid[r][c-1].isVisited == false) { neighbors.add(grid[r][c-1]); }

      if (neighbors.size() == 0) return null;
      else {
        int rand = (int)(Math.random() * neighbors.size());
        return neighbors.get(rand);
      }
    }


  }


}
