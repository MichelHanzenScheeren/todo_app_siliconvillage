import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';

main() {
  group('Uso básico do construtor (apenas título e descrição)', () {
    final Task task = Task(
      title: 'Meu teste',
      description: 'Esse é o primeiro teste',
    );
    test('Deve atribuir um id automático válido', () {
      expect(task.id, isInstanceOf<String>());
      expect(task.id.length, 20);
    });
    test('Deve atribuir os valores passados de title e description', () {
      expect(task.title, 'Meu teste');
      expect(task.description, 'Esse é o primeiro teste');
    });
    test('Deve atribuir falso ao parâmetro checked', () {
      expect(task.checked, isFalse);
    });
    test('Deve atribuir data válida de criação e update', () {
      expect(task.createdDate, isInstanceOf<DateTime>());
      expect(task.updatedDate, isInstanceOf<DateTime>());
    });
  });

  group('Se nada foi passado, título e description devem ser string vazia', () {
    final Task task = Task();
    test('Título deve ser string vazia', () {
      expect(task.title, '');
    });
    test('Description deve ser string vazia', () {
      expect(task.description, '');
    });
  });

  group('Uso do construtor completo', () {
    final Task task = Task(
        id: '12345678912345678912',
        title: 'Teste',
        description: 'Meu teste',
        checked: true,
        created: DateTime(2022, 1, 1));
    test('ID passado deve ser mantido', () {
      expect(task.id, '12345678912345678912');
    });
    test('Checked deve ser true', () {
      expect(task.checked, true);
    });
    test('Data deve ser mantida', () {
      expect(task.createdDate.year, 2022);
      expect(task.createdDate.month, 1);
      expect(task.createdDate.month, 1);
    });
  });

  group('Teste dos métodos de update', () {
    final Task task = Task();
    test('Teste toggle do checked', () {
      expect(task.checked, false);
      task.toggleTask();
      expect(task.checked, true);
    });
    test('Update de título e descrição', () {
      task.updateTask(newTitle: 'Título', newDescription: 'Descrição');
      expect(task.title, 'Título');
      expect(task.description, 'Descrição');
    });
  });
}
