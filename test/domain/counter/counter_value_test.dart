import 'package:count_habits/domain/counter/entity/value_object/counter_value.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:test/test.dart';

void main() {
  group('CounterValue Objectのinitインスタンス生成', () {
    test('任意のnameが設定された場合、任意のnameと0がフィールドに設定されること', () {
      const name = 'testName';
      final counterValue = CounterValue.init(name: name);
      expect(counterValue.name, name);
      expect(counterValue.count, 0);
    });
    test('空のnameが設定された場合、Exceptionがthrowされること', () {
      const name = '';
      expect(
        () {
          CounterValue.init(name: name);
        },
        throwsA(isA<AppException>()),
      );
    });
  });

  group('increment getterテスト', () {
    test('incrementメソッドによって+1インクリメントされたCounterValueが返却されること', () {
      const name = 'testName';
      final counterValue = CounterValue.init(name: name);
      expect(counterValue.count, 0);
      final incrementValue = counterValue.increment;
      expect(incrementValue.count, 1);
    });
  });
}
