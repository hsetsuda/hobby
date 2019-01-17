import java.awt.*;
import java.io.*;
import java.util.*;

public class RandomWalk extends Frame
{   //public Color  color1,color2,color3;
  public Color colors[] = new Color[10];

  // Main
  public static void main(String args[])
  {   new RandomWalk();
    System.out.println(Long.parseLong(args[0]));
  }

  // Constructor
  public RandomWalk()
  {   super("DrawRect AWT");
    //color1 = new Color(255,0,0);
    colors[0] = new Color(255,0,0);
    colors[1] = new Color(0,255,0);
    colors[2] = new Color(0,0,255);
    colors[3] = new Color(255,255,0);
    colors[4] = new Color(0,255,255);
    colors[5] = new Color(255,0,255);
    colors[6] = new Color(100,100,0);
    colors[7] = new Color(0,100,100);
    colors[8] = new Color(100,0,100);
    colors[9] = new Color(100,100,100);
    setSize(800,800);
    setVisible(true);
  }

  // Paint Method
  public void paint(Graphics g)
  {   super.paint(g);
    Scanner scanner = new Scanner(System.in); // To insert value from keyboard
    //g.setColor(color1);
    long a = 0x01L;
    long b;

    // Insert N, M and n from keyboard
    System.out.println("How much is Max of Random walk steps ?");
    String input_N = scanner.nextLine();
    System.out.println("How much is InitializeNUM ?");
    String input_M = scanner.nextLine();
    System.out.println("How many times trial each Walk ?");
    String input_n = scanner.nextLine();
    
    long N = Long.parseLong(input_N); // Number of Random Walk steps
    long M = Long.parseLong(input_M); // Number for adjusting LFSR
    int n = Integer.parseInt(input_n);  // Number of trials each Walk
    int l_max =(int)(Math.log10(N));
    if(l_max>10){
    System.out.println(" N is too much to set colors[10]. ");
    System.exit(0);
    }

    for(long i = 0; i < M; i++){
      b = ( ( a >> 38 ) ^ ( a >> 34 ) ) & 0x01;
      a = ( ( a <<  1 ) |   b         ) & 0x7FFFFFFFFFL;
    }

    for(int l = 0; l < l_max; l++){
      if(l!=0){
        N /= 10;
      }
      g.setColor(colors[l]);
      double r_sum = 0;

      for(int k = 0; k < n; k++){
        int x = 400;
        int y = 400;
        double r_max = 0;

        for(long j = 0; j < N; j++){
          b = ( ( a >> 38 ) ^ ( a >> 34 ) ) & 0x01;
          a = ( ( a <<  1 ) |   b         ) & 0x7FFFFFFFFFL;

          if(b==0){
            x += 1;
          }
          if(b==1){
            x -= 1;
          }

          b = ( ( a >> 38 ) ^ ( a >> 34 ) ) & 0x01;
          a = ( ( a <<  1 ) |   b         ) & 0x7FFFFFFFFFL;
          if(b==0){
            y += 1;
          }
          if(b==1){
            y -= 1;
          }
          g.drawRect(x,y,1,1);

          int dx = Math.abs(x-400); //abs(A) = get absolute value of A
          int dy = Math.abs(y-400);
          double r = Math.sqrt(dx*dx + dy*dy);
          //update max value of r(=r_max)
          if(r_max<r){
            r_max = r;
          }
        }
        //System.out.println(r_max);
        r_sum += r_max;
        //System.out.println(r_sum);
      }
      System.out.println(N);
      System.out.println(r_sum/n);
    }
    System.out.println("Type 0 for exit");
    String zero = scanner.nextLine();
    System.exit(Integer.parseInt(zero));
  }
}
