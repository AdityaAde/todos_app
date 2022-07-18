import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/add_data.dart';
import 'package:todo_app/screen/login_screen.dart';

void main() async {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodosProvider>(create: (context) {
          return TodosProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
