import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';

void main() => runApp(MyPiano());

class MyPiano extends StatelessWidget {

  void playSound(int soundNumber) {
    final player = new AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(''),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("MyPiano App"),
              backgroundColor: Colors.redAccent,
              elevation: 20,
              actions: [
                MySelection(),
              ],
            ),

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                buildKey(color: Colors.yellowAccent, soundNumber: 1),
                buildKey(color: Colors.teal, soundNumber: 2),
                buildKey(color: Colors.blue, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.white, soundNumber: 5),
                buildKey(color: Colors.pink, soundNumber: 6),
                buildKey(color: Colors.purple, soundNumber: 7),
              ],
            ),
          ),
      ),
      );
  }
}

class MySelection extends StatelessWidget {
  const MySelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _navigationSelection(context);
      },
      icon: Icon(Icons.account_circle),

    );
  }
}



void _navigationSelection(BuildContext context)
async{
  final result = await Navigator.push(context,
    MaterialPageRoute(
        builder: (context) => SelectionScreen()),
  );
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}


class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Name: Karthik Prasad', style: TextStyle(color: Colors.teal, fontSize: 20),),
          Text('Email: karthikprasadvittla@gmail.com', style: TextStyle(color: Colors.teal, fontSize: 20),),
          Text('Course: B.E.', style: TextStyle(color: Colors.teal, fontSize: 20),),
          Text('Branch: Electronics and communication', style: TextStyle(color: Colors.teal, fontSize: 20),),
          Text('College: Vivekananda college of Engineering and Technology, Puttur', style: TextStyle(color: Colors.teal, fontSize: 20),),
          Text('State: Karnataka', style: TextStyle(color: Colors.teal, fontSize: 20),),
        ],

      ),
    );
  }
}
