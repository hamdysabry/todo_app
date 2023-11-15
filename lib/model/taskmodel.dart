class TaskModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  TaskModel.fromFirestore(Map<String, dynamic> data)
      : this(
            id: data["id"],
            title: data["title"],
            description: data["description"],
            dateTime: DateTime.fromMillisecondsSinceEpoch(data["datetime"]),
            isDone: data["isDone"]);

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "datetime": dateTime.millisecondsSinceEpoch,
      "isDone": isDone
    };
  }
}
