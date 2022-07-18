import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/add_data.dart';
import 'package:todo_app/widget/todo_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE-MM-yyyy');
    final String formatted = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
        centerTitle: true,
      ),
      body: todos.isEmpty
          ? Center(
              child: Text(
                'No todos.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        formatted,
                        style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
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
                Expanded(
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
