import 'package:testproject/pet_abstract.dart';

import 'dog_model.dart';

class DogViewModel implements Pet {
  int hungryPoint = 5; //above 5 is hungry, and lower than 5 is okay / full

  @override
  Future<void> eat(Dog dog, String? food) async {
    // await Future.delayed(Duration(seconds: 1));

    if (isHungry(dog.hungyLevel)) {
      if (dog.favoriteFoods != null) {
        if (dog.favoriteFoods!.contains(food)) {
          dog.affectionLevel++; //another ++ , so if favorite food affection add total of + 2
        }
      }
      dog.affectionLevel++;
    } else {
      dog.affectionLevel -= 2;
    }

    dog.hungyLevel--;
  }

  @override
  Future<void> play(Dog dog) async {
    // await Future.delayed(Duration(seconds: 1));

    if (dog.hungyLevel >= 10) {
      dog.affectionLevel--;
      dog.hungyLevel += 2;
      return null;
    }

    dog.affectionLevel++;
    dog.hungyLevel++;
  }

  @override
  bool isHungry(int hungryLevel) {
    if (hungryLevel > hungryPoint) {
      return true;
    } else {
      return false;
    }
  }

  reset(Dog dog) {
    dog.hungyLevel = hungryPoint;
    dog.affectionLevel = 0;
  }

  // @override
  // Future<int> sleep(int affectionLevel) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return affectionLevel++;
  // }
}
