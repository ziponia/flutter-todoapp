class Todo {
  String? id;
  String title;
  String content;
  String? createdAt;

  Todo(
      {this.id,
      required this.title,
      required this.content,
      this.createdAt}) {
    createdAt ??= DateTime.now().toIso8601String();
  }

  factory Todo.fromJson(dynamic json) => Todo(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['createdAt']);

  toJson() => {
        "title": title,
        "content": content,
        "createdAt": createdAt
      };
}
