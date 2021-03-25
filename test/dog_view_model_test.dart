import 'package:flutter_test/flutter_test.dart';
import 'package:testproject/dog_model.dart';
import 'package:testproject/dog_view_model.dart';

// @GenerateMocks([Dog, DogViewModel])
void main() {
  var dogViewModel = DogViewModel();
  dogViewModel.hungryPoint = 5;

  group('Test for DogViewModel Class ', () {
    test('Pet hungry status should be NOT HUNGRY FALSE ', () {
      expect(dogViewModel.isHungry(5), false);
    });
    test('Pet hungry status should be HUNGRY TRUE ', () {
      expect(dogViewModel.isHungry(6), true);
    });
    test('Reset status back to default ', () {
      var dog = Dog(name: 'test');

      dogViewModel.reset(dog);
      expect(dog.hungyLevel, dogViewModel.hungryPoint);
    });
    test('If play should added the affection and hungry level ', () {
      var dog = Dog(name: 'test');

      var affection = dog.affectionLevel;
      var hungry = dog.hungyLevel;
      dogViewModel.play(dog);

      expect(dog.affectionLevel, affection + 1);
      expect(dog.hungyLevel, hungry + 1);
    });
    test('If feed should reduce hungry level ', () {
      var dog = Dog(name: 'test');

      var affection = dog.affectionLevel;
      var hungry = dog.hungyLevel;

      dogViewModel.eat(dog, 'fish');
      expect(dog.hungyLevel, hungry - 1);
    });
    test('If feed and not hungry lessen affection by 2 ', () {
      var dog = Dog(name: 'test');

      var affection = dog.affectionLevel;
      var hungry = dog.hungyLevel;

      dogViewModel.eat(dog, 'fish');

      expect(dog.affectionLevel, affection - 2);
    });
    test('If feed and hungry added affection by 1 ', () {
      var dog = Dog(name: 'test');

      var affection = dog.affectionLevel;
      dog.hungyLevel = 6;

      dogViewModel.eat(dog, 'fish');

      expect(dog.affectionLevel, affection + 1);
    });
    test('If hungry  and feed with favorite dish ', () {
      var dog = Dog(name: 'test');

      dog.favoriteFoods = ['meat'];

      var affection = dog.affectionLevel;
      dog.hungyLevel = 6;

      dogViewModel.eat(dog, 'meat');

      expect(dog.affectionLevel, affection + 2);
    });
  });
}
