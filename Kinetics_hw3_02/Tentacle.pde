import java.util.Random;

private static Random random = new Random();

public class Tentacle
{
  Segment[] segments = new Segment[15];
  PVector base;
  float len = 90;
  private int numberOfSegments;
  

  public Tentacle(float x, float y, int numberOfSegments)
  {
    base = new PVector(x,y);
    this.numberOfSegments = Math.max(numberOfSegments, 1);
    segments = new Segment[this.numberOfSegments];
    segments[0] = new Segment(300, 100, len, 0);
    for (int i=1; i<segments.length; i++)
    {
      segments[i] = new Segment(segments[i-1], len, i);  
    }
  
  }
  
  public void update()
  {
      int total = segments.length;
      Segment end = segments[total-1];
      end.follow(pos.x, pos.y);
      end.update();
      
      for(int i= total-2; i>=0; i--)
      {
        segments[i].follow(segments[i+1]);
        segments[i].update();
      }//end of for
      
      segments[0].setA(base);
      
      for(int i=1; i < total; i++)
      {
        segments[i].setA(segments[i-1].b);
      }//end of for
      
      for (int i=0; i<total; i++)
      {
        segments[i].show();
      }//end of for
  }// end of update()
  
  void show()
  {
      for(Segment s: segments)
      {
        fill(210, 56, 51, 200);
        s.show();
      }
  }// end of show()
  
  
}
