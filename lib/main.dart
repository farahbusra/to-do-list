import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const TodoList(title: 'My To-do List'),
    );
  }
}

class Task {
  String? title;
  String? description;
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _textDescController = TextEditingController();
  final _textTitleController = TextEditingController();
  List<Task> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _textTitleController,
                decoration: InputDecoration(
                  hintText: "To-do Title",
                  border: OutlineInputBorder(),
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _textDescController,
                decoration: InputDecoration(
                  hintText: "To-do Description",
                  border: OutlineInputBorder(),
                ),
              )
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(todoList[index].title??'empty', style: TextStyle(color: Colors.blue),),
                  subtitle: Text(todoList[index].description??'empty',
                    style: TextStyle(color: Colors.blue),),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Task todoItem = Task();
          todoItem.title = _textTitleController.text;
          todoItem.description = _textDescController.text;
          setState(() {
            todoList.add(todoItem);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}