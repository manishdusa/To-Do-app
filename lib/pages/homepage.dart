import 'package:flutter/material.dart';
import 'package:todo_list/util/diaog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //text controller
  final _controller = TextEditingController();
  //list of todo tasks
  List toDoList = [
    ["Make tutorial", true],
    ["task2", false]
  ];
  // late AnimationController _controller;

  //checkBox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //saveNewTask
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Create New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // (_controller = AnimationControllevsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: Text(
          'TO-DO',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black45,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellowAccent, Colors.orangeAccent],
            ),
          ),
        ),
      ),
      //Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 252, 217, 78),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFeedc83), Color(0xFFfbe106)],
          ),
        ),
        child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 12.0,
                ),
                ToDoTile(
                  taskName: toDoList[index][0],
                  taskCompleted: toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                ),
              ],
            );
          },
          // children: [
          //    ToDoTile(
          //     taskName: "Task1",
          //     taskCompleted: true,
          //     onChanged: (p0) {

          //     },
          //    ),
          //    ToDoTile(
          //     taskName: "Task2",
          //     taskCompleted: false,
          //     onChanged: (p0) {

          //     },
          //    ),
          // ],
        ),
      ),
    );
  }
}
