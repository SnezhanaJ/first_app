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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const CoursesListScreen(),
    );
  }
}

class CoursesListScreen extends StatefulWidget {
  const CoursesListScreen({super.key});

  @override
  State<CoursesListScreen> createState() => _CoursesListScreenState();
}

class _CoursesListScreenState extends State<CoursesListScreen> {
  List<String> _courses = ['Web Programming', 'Team Project',
    'Managment Informational Systems', 'Mobile Informational Systems',
    'Programming of video games','Analysis and design of IS'];

  void addNewCourse(){
    showDialog(context: context, builder: (BuildContext context){
      String newCourse="";
      return AlertDialog(
        title: Text("Add a new course"),
        content: TextField(
          onChanged: (value){
            newCourse = value;
          },
        ),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              if(newCourse.isNotEmpty){
                _courses.add(newCourse);
              }
              Navigator.pop(context);
            });
          },
              child: const Text("Add Course"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("195002"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ) ,
      body: ListView.builder(
          itemCount: _courses.length,
          itemBuilder: (context, index){
            return ListTile(
                title: Text(_courses[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _courses.removeAt(index);
                      });
                    }
                )


            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewCourse,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add_box_rounded),

      ),
    );
  }
}


