import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/kids_home_page_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Math App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: KidsHomePage(),
    );
  }
}
class QuizPage extends StatefulWidget {

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _formKey = GlobalKey<FormState>();

  late String answer;
  late Timer timer;
  late int seconds;

  @override
  void initState() {
    super.initState();
    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        seconds++;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizPage'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text('Question?'),
            Text('Seconds passed: $seconds'),
            TextFormField(
              onSaved: (result) =>  answer = result!,
            ),
            RaisedButton(
              child: Text('Answer!'),
              onPressed:(){
                timer?.cancel();
                _formKey.currentState!.save();
                print(answer);
                print('In $seconds seconds');
              },
            )
          ],
        ),
      ),
    );
  }
}