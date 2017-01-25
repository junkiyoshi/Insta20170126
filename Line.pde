class Line
{
  PVector[] history;
  
  Line(float x, float y)
  {
    history = new PVector[20];
    for(int i = 0; i < history.length; i++)
    {
      history[i] = new PVector(x, y);
    }
  }
  
  void update(float x, float y)
  {
    for(int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i - 1].copy();
    }
    history[0] = new PVector(x, y);
  
    for(int i = 0; i < history.length - 1; i++)
    {
      stroke(0, 255 - i * 30, 255 - i * 30, 255);
      strokeWeight(8);
      line(history[i].x, history[i].y, history[i + 1].x, history[i + 1].y);
      
      float d = dist(history[i].x, history[i].y, history[i + 1].x, history[i + 1].y);
      float r = atan2(history[i].y - history[i + 1].y, history[i].x - history[i + 1].x);
            
      for(int j = 0; j < d; j += 10)
      {
        float r_x = j * cos(r);
        float r_y = j * sin(r);
        Particle p = new Particle(history[i].x + r_x, history[i].y + r_y, 8, color(particles.size() % 255, 255, 255));
        p.body.setLinearVelocity(new Vec2(r_x * 1.5, -r_y * 1.5));
        particles.add(p);
      }
    }
  }
}