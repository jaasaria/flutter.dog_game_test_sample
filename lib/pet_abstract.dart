import 'dog_model.dart';

abstract class Pet {
  Future<void> eat(Dog dog, String? food);
  Future<void> play(Dog dog);

  bool isHungry(int hungryLevel);

  // Future<int> sleep(int affectionLevel);
}
