import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/todo_controller.dart';
import 'package:todo_app/todo_model.dart';

class TodoAddScreen extends StatefulWidget {
  String? id;

  TodoAddScreen({Key? key, this.id}) : super(key: key);

  @override
  _TodoAddScreen createState() => _TodoAddScreen();
}

class _TodoAddScreen extends State<TodoAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TodoController _todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();

    _titleController.addListener(_handleTitle);
    _contentController.addListener(_handleContent);

    if (widget.id != null) {
      print("find id: ${widget.id}");
      var _todo =
          _todoController.list.firstWhere((element) => element.id == widget.id);
      print("_todo.title: ${_todo.title}");
      _titleController.text = _todo.title;
      _contentController.text = _todo.content;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _handleTitle() {
    print("_titleController.value.text: ${_titleController.value.text}");
  }

  void _handleContent() {}

  void _handleSave() {
    var title = _titleController.value.text;
    var content = _contentController.value.text;
    var todo = Todo(id: widget.id, title: title, content: content);
    _todoController.save(todo);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("새로운 투두"),
          actions: [
            MaterialButton(
                onPressed: () {
                  _handleSave();
                },
                child: Text(
                  "저장",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "제목"),
              ),
              Divider(
                height: 20,
              ),
              TextField(
                controller: _contentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: "내용"),
              )
            ],
          ),
        ));
  }
}
