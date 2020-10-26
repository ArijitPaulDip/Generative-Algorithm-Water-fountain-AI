class ArrowBucket {
  Arrow[] arrows;
  float maxFitness = 0;
  float fitnessSum = 0;
  int best = 0;
  int generation = 1;

  ArrowBucket(int capacity) {
    arrows = new Arrow[capacity];
    for (int i = 0; i < capacity; i++) {
      arrows[i] = new Arrow();
    }
  }

  void show() {
    for (int i = 1; i < arrows.length; i++) {
      stroke(0, 50);
      arrows[i].show();
    }
    stroke(255, 0, 0);
    arrows[0].show();
  }

  void move() {
    for (int i = 0; i < arrows.length; i++) {
      arrows[i].move();
    }
  }

  boolean allAreDead() {
    for (int i = 0; i < arrows.length; i++) {
      if (!arrows[i].dead) {
        return false;
      }
    }
    return true;
  }

  void mutate() {
    for (int i = 1; i < arrows.length; i++) {
      arrows[i].brain.mutate();
    }
  }

  void calculateFitness() {
    fitnessSum = 0;
    maxFitness = 0;
    for (int i = 0; i < arrows.length; i++) {
      arrows[i].calculateFitness();
      fitnessSum += arrows[i].fitness;

      if (arrows[i].fitness > maxFitness) {
        maxFitness = arrows[i].fitness;
        best = i;
      }
    }
  }

  void naturalSelection() {
    calculateFitness();

    Arrow[] newArrows = new Arrow[arrows.length];
    newArrows[0] = new Arrow();
    newArrows[0].brain = arrows[best].brain;

    for (int i = 1; i < newArrows.length; i++) {
      Arrow b = selectParent();
      newArrows[i] = new Arrow();
      newArrows[i].brain = b.brain.clone();
    }

    for (int i = 0; i < arrows.length; i++) {
      arrows[i] = newArrows[i];
    }
    mutate();
    generation++;
  }

  Arrow selectParent() {
    float rand = random(fitnessSum);
    float runningSum = 0;
    for (int i = 0; i < arrows.length; i++) {
      runningSum += arrows[i].fitness;
      if (runningSum > rand) {
        return arrows[i];
      }
    }
    println("Something is wrong");
    return arrows[(int) random(fitnessSum)];
  }
}
