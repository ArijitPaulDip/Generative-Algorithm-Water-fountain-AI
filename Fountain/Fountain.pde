ArrowBucket bucket;

void setup() {
  background(255);
  size(600, 600);
  bucket = new ArrowBucket(1000);
  stroke(0, 255, 0);
  fill(0);
  Brain bestBrain = bucket.arrows[bucket.best].brain;
  text("--Result of previous Generation--\nGeneration : " + bucket.generation + "\nu = " + bestBrain.u + "\nangle = " + degrees(bestBrain.angle)
    + "\nMinimum distance from target = " + bestBrain.distance, 50, 50);
  line(0, height/2, width, height/2);
}

void draw() {
  translate(0, height/2);
  ellipse(width, 0, 2, 2);
  bucket.show();
  stroke(0);
  fill(0);
  line(0, 0, width, 0);
  if (bucket.allAreDead()) {
    background(255);
    
    bucket.naturalSelection();
    Brain bestBrain = bucket.arrows[bucket.best].brain;
    fill(0);  
    text("--Result of previous Generation--\nGeneration : " + bucket.generation + "\nu = " + bestBrain.u + "\nangle = " + degrees(bestBrain.angle)
      + "\nMinimum distance from target = " + bestBrain.distance, 50, -height/2 + 50);
  }
}
