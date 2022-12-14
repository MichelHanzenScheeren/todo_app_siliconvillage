import 'package:either_dart/either.dart';
import 'package:todo_app_siliconvillage/domain/models/my_error.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';

abstract class DatabaseContract {
  Future<Either<MyError, List<Task>>> readTasks();
  Future<Either<MyError, String>> createTask(Task task);
  Future<Either<MyError, String>> updateTask(Task task);
  Future<Either<MyError, String>> deleteTask(String id);
}
