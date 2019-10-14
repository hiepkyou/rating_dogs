import 'package:flutter/material.dart';
import 'package:my_dog/dog_list.dart';
import 'package:my_dog/dog_model.dart';
import 'package:my_dog/new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'We rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var initialDoggos = <Dog> []
    ..add(new Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(new Dog('Rex', 'Seattle, WA, USA', 'A Very Good Boy'))
    ..add(new Dog('Rod Stewart', 'Prague, CZ', 'A Very Good Boy'))
    ..add(new Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(new Dog('Buddy', 'North Pole, Earth', 'A Very Good Boy'));


  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new AddDogFormPage();
         }
      )
    );

    ;
    if(newDog != null){
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=> _showNewDogForm()
          )
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            stops: [0.1,0.5,0.5,0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ]
          )
        ),

        child: Center(
          child: new DogList(initialDoggos),
        ),
      ),
    );
  }
}

