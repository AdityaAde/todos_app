import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/add_data.dart';
import 'package:todo_app/widget/todo_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE-MM-yyyy');
    final String formatted = formatter.format(now);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            color: Colors.blue,
            height: size.height * 0.2,
            width: double.infinity,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                ),
                SizedBox(width: 20),
                Text(
                  "Hallo, " + user.displayName + "!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  formatted,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Task List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          todos.isEmpty
              ? Center(
                  child: Text(
                    'No todos.',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    separatorBuilder: (context, index) => Container(height: 8),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];

                      return TodoWidget(todo: todo);
                    },
                  ),
                )
        ],
      ),
    );
  }
}
