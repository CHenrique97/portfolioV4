import 'package:flutter/material.dart';
import 'package:porfoliov3/store/states.dart';
import 'package:provider/provider.dart';
import './shared/screen.dart';
import './shared/projects.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => StateModel(),
    child: const Main() 
      )
    );
}

class Main extends StatelessWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(title :const Text('Portfolio '),backgroundColor: Colors.grey, centerTitle: true,
         ),
        body:  Center(
          child: Consumer<StateModel>(
            builder: ( context, state, child) => Column(
              children:  [Screen(data: state.get(),),Projects()],
            ),
          ),
        ),
      ),
    );
  }
}