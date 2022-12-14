import 'package:todo_app_siliconvillage/domain/models/task.dart';

const titleKey = 'title';
const descriptionKey = 'description';
const checkedKey = 'checked';
const createdKey = 'createdDate';
const updatedKey = 'updatedDate';

class TaskConverter {
  static Task fromMap(String id, Map<String, dynamic> map) {
    return Task(
      id: id,
      title: map[titleKey],
      description: map[descriptionKey],
      checked: map[checkedKey],
      created: DateTime.parse(map[createdKey].toDate().toString()),
      updated: DateTime.parse(map[updatedKey].toDate().toString()),
    );
  }

  static Map<String, dynamic> toMap(Task task) {
    return <String, dynamic>{
      titleKey: task.title,
      descriptionKey: task.description,
      checkedKey: task.checked,
      createdKey: task.createdDate,
      updatedKey: task.updatedDate,
    };
  }
}
