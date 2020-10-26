class Arrow {
  float goalx = width;
  float goaly = 0;
  float fitness = 0;
  float x = 0, y = 0;
  float t = 0;

  Brain brain;

  float g = 9.8;

  boolean dead = false;
  boolean reached = false;
  
  Arrow() {
    brain = new Brain();
  }

  void show() {
    if (!dead) {
      move();
    }
    point(x, -y);
    update();
  }

  void move() {
    this.x = brain.u*cos(brain.angle)*t;
    this.y = brain.u*sin(brain.angle)*t - 0.5*g*t*t;
    t += 0.02;
  }

  void calculateFitness() {
    float dist = dist(goalx, goaly, x, y);
    fitness = 1/dist;
    brain.distance = dist;
  }

  void update() {
    if (dist(goalx, goaly, x, y) <= 2) {
      dead = true;
      reached = true;
    } else if (x >= width || y < -height || y > height/2) {
      dead = true;
    }
  }
}
