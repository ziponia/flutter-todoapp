import 'dart:math';

import 'package:get/get.dart';
import 'package:todo_app/todo_model.dart';

class TodoController extends GetxController {
  var list = <Todo>[].obs;
  var count = 0.obs;

  save(Todo todo) async {
    if (todo.id == null) {
      todo.id = DateTime.now().millisecondsSinceEpoch.toString();
      list.add(todo);
    } else {
      var findIndex = list.indexWhere((element) => element.id == todo.id!);
      list[findIndex].title = todo.title;
      list[findIndex].content = todo.content;
    }
    update();
  }

  setNumber(int number) {
    count = number.obs;
    update();
  }
}
