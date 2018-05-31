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
      }
      
      segments[0].setA(base);
      
      for(int i=1; i < total; i++)
      {
        segments[i].setA(segments[i-1].b);
      }
      
      for (int i=0; i<total; i++)
      {
        segments[i].show();
      }
  }
  
  void show()
  {
      for(Segment s: segments)
      {
        //s.setColor(210);
        fill(210, 56, 51, 200);
        s.show();
      }
  }
  
  //void show(int theColor)
  //{
  //    for(Segment s: segments)
  //    {
  //      //s.setColor(theColor);
  //      fill(210, 56, 51, 200);
  //      s.show();
  //    }
  //}
  
  
}
