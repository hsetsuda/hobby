import java.io.*;

public class Rnds_m7{
  public static void main(String[] args){
    int a = 0x02;
    int b;
    int N = Integer.parseInt(args[0]);
    String bout;

    for(int i = 0; i < N; i++){
      b = ( ( a >> 5 ) ^ ( a >> 6 ) ) & 0x01;
      a = ( ( a << 1 ) |   b        ) & 0x7F;
      bout = String.format( "%32s", Integer.toBinaryString(a) );
      System.out.println( bout );
      if( a == 1 ){ System.out.println( i+1 );};
    }
  }
}

