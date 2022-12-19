import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_siliconvillage/domain/models/text.dart';

main() {
  group('Teste método getNumbers', () {
    test('Passando string vazia', () {
      expect(Text('').getNumbers(''), []);
    });
    test('Passando string com espaços', () {
      expect(Text('').getNumbers('   '), []);
    });
    test('Passando uma palavra', () {
      expect(Text('').getNumbers('Olá'), []);
    });
    test('Passando múltiplas palavras', () {
      expect(Text('').getNumbers(' Olá teste teste2'), []);
    });
    test('Passando um número entre palavras', () {
      expect(Text('').getNumbers(' Olá teste 50 teste2'), ['50']);
    });
    test('Passando múltiplos números entre palavras', () {
      expect(Text('').getNumbers(' Olá 1008 teste 50 teste2'), ['1008', '50']);
    });
    test('Apenas um número', () {
      expect(Text('').getNumbers('1008'), ['1008']);
    });
    test('Apenas um número', () {
      expect(Text('').getNumbers(' 1008 10 '), ['1008', '10']);
    });
  });

  group('Teste getSubstrings', () {
    test('Testando com um único número', () {
      expect(Text('').getSubstrings('1'), ['1']);
    });
    test('Testando com dois números', () {
      expect(Text('').getSubstrings('12'), ['12']);
    });
    test('Testando com três números', () {
      expect(Text('').getSubstrings('123'), ['123']);
    });
    test('Testando com quatro números', () {
      expect(Text('').getSubstrings('1234'), ['1', '234']);
    });
    test('Testando com vários números', () {
      expect(Text('').getSubstrings('12345678'), ['12', '345', '678']);
    });
  });

  group('Teste resultado final com números unitários', () {
    test('string vazia', () {
      final text = Text('');
      expect(text.value, '');
    });
    test('apenas uma palavra', () {
      final text = Text('Olá');
      expect(text.value, 'Olá');
    });
    test('apenas palavras', () {
      final text = Text('Olá teste ');
      expect(text.value, 'Olá teste ');
    });
    test('apenas um número unitário', () {
      final text = Text('5');
      expect(text.value, 'cinco');
    });
    test('dois números unitários', () {
      final text = Text('9 0');
      expect(text.value, 'nove zero');
    });
    test('três números unitários', () {
      final text = Text('9 0 7 ');
      expect(text.value, 'nove zero sete ');
    });
    test('um número entre palavras', () {
      final text = Text('teste1 8 teste2');
      expect(text.value, 'teste1 oito teste2');
    });
    test('dois número entre palavras', () {
      final text = Text('teste1 8 7 test2e');
      expect(text.value, 'teste1 oito sete test2e');
    });
    test('três número entre palavras', () {
      final text = Text('teste1 8 7 test2e 3');
      expect(text.value, 'teste1 oito sete test2e três');
    });

    group('Teste resultado final com números complexos até 999', () {
      test('(9 < num < 20)', () {
        final text = Text('teste 10 11 15 19');
        expect(text.value, 'teste dez onze quinze dezenove');
      });
      test('(19 < num < 100)', () {
        final text = Text('teste 20 35 99');
        expect(text.value, 'teste vinte trinta e cinco noventa e nove');
      });
      test('(99 < num < 1000)', () {
        final text = Text('100 209 515 639 750 800 999');
        String result =
            'cem duzentos e nove quinhentos e quinze seiscentos e trinta '
            'e nove setecentos e cinquenta oitocentos novecentos e noventa e nove';
        expect(text.value, result);
      });
    });

    group('Teste resultado final com números complexos > 999', () {
      test('1000', () {
        final text = Text('teste 1000 teste2 ');
        expect(text.value, 'teste mil teste2 ');
      });
      test('1001', () {
        final text = Text('teste 1001');
        expect(text.value, 'teste mil e um');
      });
      test('2016', () {
        final text = Text('teste 2016');
        expect(text.value, 'teste dois mil e dezesseis');
      });
      test('2589', () {
        final text = Text('teste 2589');
        expect(text.value, 'teste dois mil e quinhentos e oitenta e nove');
      });
      test('425109', () {
        final text = Text('teste 425109');
        expect(text.value,
            'teste quatrocentos e vinte e cinco mil e cento e nove');
      });
      test('1000000', () {
        final text = Text('teste 1000000');
        expect(text.value, 'teste um milhão');
      });
      test('2000050', () {
        final text = Text('teste 2000050');
        expect(text.value, 'teste dois milhões e cinquenta');
      });
      test('35000500', () {
        final text = Text('teste 35000500');
        expect(text.value, 'teste trinta e cinco milhões e quinhentos');
      });
      test('00', () {
        final text = Text('teste 0');
        expect(text.value, 'teste zero');
      });
    });
  });
}
