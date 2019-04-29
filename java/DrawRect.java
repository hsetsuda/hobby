import java.awt.*;
import java.io.*;

public class DrawRect extends Frame
{   public Color  color1,color2,color3;

  // Main
  public static void main(String args[])
  {   new DrawRect();
  }

  // Constructor
  public DrawRect()
  {   super("DrawRect AWT");
    color1 = new Color(255,0,0);
    color2 = new Color(0,255,0);
    color3 = new Color(0,0,255);
    setSize(800,800);
    setVisible(true);
  }

  // Paint Method
  public void paint(Graphics g)
  {   super.paint(g);
    g.setColor(color1);
    long a = 0x01L;
    long b;
    long N = 0x58954;
    long M = 10000000;
    int x = 400;
    int y = 400;

    for(long i = 0; i < N; i++){
      b = ( ( a >> 38 ) ^ ( a >> 34 ) ) & 0x01;
      a = ( ( a <<  1 ) |   b         ) & 0x7FFFFFFFFFL;
    }
    for(long j = 0; j < M; j++){
      b = ( ( a >> 38 ) ^ ( a >> 34 ) ) & 0x01;
      a = ( ( a <<  1 ) |   b         ) & 0x7FFFFFFFFFL;

      if(b==0){
        x=x+1;
      }
      if(b==1){
        x=x-1;
      }

      b = ( ( a >> 38 ) ^ ( a >> 34 ) ) & 0x01;
      a = ( ( a <<  1 ) |   b         ) & 0x7FFFFFFFFFL;
      if(b==0){
        y=y+1;
      }
      if(b==1){
        y=y-1;
      }
      g.drawRect(x,y,1,1);

    }
  }
}
