import 'package:flutter/material.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFeedc83),Color(0xFFfbe106)],
          ),
        ),
        child: ListView(
          children: [
             ToDoTile(),
          ],
        ),
      ),

    );
  }
}
