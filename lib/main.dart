import 'package:flutter/material.dart';
import 'package:testproject/dog_view_model.dart';

import 'dog_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dog myDog = Dog(name: 'Belle');
  DogViewModel dogViewModel = DogViewModel();

  @override
  void initState() {
    super.initState();

    myDog.favoriteFoods = ['barbeque', 'hotdog'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCustomButton(onClicked: () => eat(), title: 'Eat'),
                buildCustomButton(
                    onClicked: () => eatFavorite(), title: 'Eat Favorite Food'),
                buildCustomButton(onClicked: () => play(), title: 'Play')
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Status:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Text('Name: ${myDog.name}'),
            Text('Affection: ${myDog.affectionLevel}'),
            Text('Hungry Level: ${myDog.hungyLevel}'),
            Text('Is Hungry: ${dogViewModel.isHungry(myDog.hungyLevel)}'),
            SizedBox(
              height: 50,
            ),
            buildCustomButton(onClicked: () => reset(), title: 'Reset'),
          ],
        ),
      ),
    );
  }

  eat() {
    setState(() {
      dogViewModel.eat(myDog, 'fish');
    });
  }

  eatFavorite() {
    setState(() {
      dogViewModel.eat(myDog, 'hotdog');
    });
  }

  play() {
    setState(() {
      dogViewModel.play(myDog);
    });
  }

  reset() {
    setState(() {
      dogViewModel.reset(myDog);
    });
  }

  ElevatedButton buildCustomButton(
      {required VoidCallback onClicked, required String title}) {
    return ElevatedButton(
        onPressed: onClicked,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(title),
        ));
  }
}
