import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '201042',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Prva Laboratoriska Vezba'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String newSubject = "";
  List<String> subjects = ["Веб базирани системи", "Програмирање на видео игри", "Мобилни информациски системи", "Имплементација на системи со слободен и отворен код", "Тимски проект"];
  final newSubjectController = TextEditingController();

  void addSubjectDialog() {
    showDialog(context: context, builder: (context) => AlertDialog(content: Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        children: [
        Expanded(
          child: TextFormField(
            controller: newSubjectController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Внесете го името на предметот',
              ),),
        ),
        ElevatedButton(onPressed: () {
          this.setState(() {
            this.subjects.add(newSubjectController.text);
            Navigator.pop(context);
          });
        }, child: Text('Додади'))
        ],
      )

      ,
    )),);
  }

  void removeSubject(String subject) {
    
    this.setState(() {
      this.subjects.remove(subject);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.teal[900],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('201042', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(color: Colors.cyan[100]),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  ListView.separated(itemCount: this.subjects.length, scrollDirection: Axis.vertical, shrinkWrap: true,  separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 3.0,
                                    height: 3.0,
                                  );
                                }, itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.teal[900],
                    child: (
                      Row(children: [
                        Expanded(child: Padding(padding: EdgeInsets.all(10), child: Text(this.subjects[index], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))),
                        IconButton(onPressed: () {
removeSubject(this.subjects[index]);
                        } , icon: Icon(Icons.remove_circle), iconSize: 30, color: Colors.red[300],),
                      ],)
                    ),
                  );
                    
                }),
                
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addSubjectDialog,
        tooltip: 'Додади нов предмет',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
