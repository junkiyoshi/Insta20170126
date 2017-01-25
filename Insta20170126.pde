import java.util.*;
import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;

ArrayList<Particle> particles;
Line line;
Box box;

PImage img;

void setup()
{
  size(512, 512);
  frameRate(60);
  background(0);
  colorMode(HSB);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  
  img = loadImage("Lenna.png");
  image(img, 0, 0);
  loadPixels();
  
  particles = new ArrayList<Particle>();
  line = new Line(width / 2, height /2);
  box = new Box();
}

void draw()
{ 
  background(0);
  box2d.step();
  
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle p = it.next();
    p.display();
    
    if(p.isDead())
    {
      it.remove();
    }
  }
  
  if(mousePressed)
  {
    line.update(mouseX, mouseY);
  }
}

void mousePressed()
{
  line = new Line(mouseX, mouseY);
}