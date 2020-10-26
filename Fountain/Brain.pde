class Brain {
  float learningRate = 0.01;
  float distance = (float) Double.POSITIVE_INFINITY;
  float u, angle;
  
  Brain() {
    u = random(100);
    angle = random(TWO_PI);
  }

  void mutate() {
    float rand = random(1);
    if (rand < learningRate) {
      u += random(-50, 50);// twicks the value of u
    }
    rand = random(1);
    if (rand < learningRate) {
      angle += random(-PI, PI)*learningRate;// twicks the value of angle
    }
  }

  Brain clone() {
    Brain clone = new Brain();
    clone.u = this.u;
    clone.angle = this.angle;
    clone.distance = this.distance;
    return clone;
  }
}
