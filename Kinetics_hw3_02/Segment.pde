public class Segment
{
  PVector a = new PVector();
  PVector b = new PVector();
  float len;
  float angle = 10;
  float sw = 3; 
   int theColor=0;
 
  Segment(float x, float y, float len_, float i, int theColor) 
  {
    a = new PVector(x,y);
    sw = 18/(i+1);
    len = len_;
    this.theColor = theColor;
    calculateB();
    
  }
  
  
   Segment(Segment parent, float len_, float i)
  {
    sw = 18/(i+1);
    a = parent.b.copy();
    len = len_;
    calculateB();
  }
  
  
  void follow(Segment child)
  {
    float targetX = child.a.x;
    float targetY = child.a.y;
    follow(targetX, targetY);
    
  }
  
  void follow(float tx, float ty)
  {
    PVector target = new PVector(tx, ty);
    PVector dir = PVector.sub(target,a);
    angle = dir.heading();
    dir.setMag(len);
    dir.mult(-1);
    a = PVector.add(target, dir);
  }
  
  void update()
  {
    calculateB();
  }
  
  void setA(PVector pos)
  {
    a = pos.copy();
    calculateB();
  }
  void calculateB()
  {
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    b.set(a.x+dx, a.y+dy);
  }
  
  void show()
  {
    stroke(this.theColor);
    strokeWeight(sw);
    line(a.x,a.y, b.x,b.y);
  }
  
  void show(int theColor)
  {
    stroke(theColor);
    strokeWeight(sw);
    line(a.x,a.y, b.x,b.y);
  }
  
  void setColor(int theColor) {
    this.theColor = theColor; 
  }
  
}
