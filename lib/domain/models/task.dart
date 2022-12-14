import 'package:uuid/uuid.dart';

class Task {
  String id;
  String title;
  String description;
  bool checked;
  late DateTime createdDate;
  late DateTime updatedDate;

  Task({
    this.id = '',
    this.title = '',
    this.description = '',
    this.checked = false,
    DateTime? created,
    DateTime? updated,
  }) {
    if (id == '') {
      id = const Uuid().v1().replaceAll('-', '').substring(0, 20);
    }
    createdDate = created ?? DateTime.now();
    updatedDate = updated ?? DateTime.now();
  }

  void updateTask(String newTitle, String newDescription) {
    title = newTitle;
    description = newDescription;
    updatedDate = DateTime.now();
  }

  void toggleTask() => checked = !checked;
}
