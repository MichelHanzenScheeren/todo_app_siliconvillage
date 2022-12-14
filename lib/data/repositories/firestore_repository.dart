import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app_siliconvillage/data/converters/task_converter.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';
import 'package:todo_app_siliconvillage/domain/models/my_error.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';

const tasksKey = 'tasks';

class FirestoreRepository implements DatabaseContract {
  final tasksCollection = FirebaseFirestore.instance.collection(tasksKey);

  @override
  Future<Either<MyError, List<Task>>> readTasks() async {
    try {
      final response = await tasksCollection.get();
      return Right(_convertTasks(response.size, response.docs));
    } catch (e) {
      return Left(MyError(
        'FirestoreRepository.readTasks',
        'Não foi possível obter os dados do servidor ($e)',
      ));
    }
  }

  List<Task> _convertTasks(int size, List docs) {
    return List<Task>.generate(
      size,
      (i) => TaskConverter.fromMap(docs[i].id, docs[i].data()),
    );
  }

  @override
  Future<Either<MyError, String>> updateTask(Task task) async {
    try {
      final Map<String, dynamic> taskMap = TaskConverter.toMap(task);
      await tasksCollection.doc(task.id).set(taskMap);
      return Right(task.id);
    } catch (e) {
      return Left(MyError(
        'FirestoreRepository.updateTask',
        'Erro ao atualizar task id ${task.id} ($e)',
      ));
    }
  }

  @override
  Future<Either<MyError, String>> createTask(Task task) async {
    return await updateTask(task);
  }

  @override
  Future<Either<MyError, String>> deleteTask(String id) async {
    try {
      await tasksCollection.doc(id).delete();
      return Right(id);
    } catch (e) {
      return Left(MyError(
        'FirestoreRepository.deleteTask',
        'Erro ao apagar task id $id ($e)',
      ));
    }
  }
}
