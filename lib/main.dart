import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/todo_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: TodoList()
      initialRoute: "/todos",
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/todos", page: () => const TodoList())
      ],
    );
  }
}
