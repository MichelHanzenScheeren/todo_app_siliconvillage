import 'package:todo_app_siliconvillage/domain/models/text.dart';
import 'package:uuid/uuid.dart';

class Task {
  String id;
  bool checked;
  late Text _title;
  late Text _description;
  late DateTime createdDate;
  late DateTime updatedDate;

  Task({
    this.id = '',
    this.checked = false,
    String? title,
    String? description,
    DateTime? createdDate,
    DateTime? updatedDate,
  }) {
    if (id == '') {
      id = const Uuid().v1().replaceAll('-', '').substring(0, 20);
    }
    _title = Text(title);
    _description = Text(description);
    this.createdDate = createdDate ?? DateTime.now();
    this.updatedDate = updatedDate ?? DateTime.now();
  }

  String get title => _title.value;
  String get description => _description.value;

  void updateTask({String? newTitle, String? newDescription}) {
    if (newTitle != null) _title = Text(newTitle);
    if (newDescription != null) _description = Text(newDescription);
    updatedDate = DateTime.now();
  }

  void toggleTask() {
    checked = !checked;
    updatedDate = DateTime.now();
  }
}
