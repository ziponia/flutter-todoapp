import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/todo_add_screen.dart';
import 'package:todo_app/todo_controller.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  @override
  Widget build(BuildContext context) {

    print("DateTime.now().microsecond: ${DateTime.now().toIso8601String()}");
    return Scaffold(
        appBar: AppBar(
          title: GetBuilder<TodoController>(builder: (_) => Text("투두 리스트 총 ${_.list.length}"),),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => TodoAddScreen());
                },
                icon: Icon(Icons.add))
          ],
        ),
        // body: Container(),
        body: SafeArea(
            child: Column(
              children: [
                Container(
                  // height: 300,
                  child: GetBuilder<TodoController>(
                    init: TodoController(),
                    builder: (_) {
                      return MaterialButton(
                          onPressed: () {
                            _.setNumber(_.count.value + 1);
                          },
                          child: Text("hello todo app ${_.list.length} 개"));
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GetBuilder<TodoController>(
                      init: TodoController(),
                      builder: (_) {
                      return ListView.builder(
                        itemCount: _.list.length,
                        itemBuilder: (context, index) {
                          print("currentId: ${_.list[index].id}");
                          return ListTile(
                            key: UniqueKey(),
                            onTap: () {
                              Get.to(() => TodoAddScreen(
                                id: _.list[index].id,
                              ));
                            },
                            title: Text(_.list[index].title),
                            subtitle: Text(_.list[index].createdAt!),
                          );
                        },
                      );
                    },)
                )
              ],
            )));
  }
}
