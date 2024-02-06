import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:test/test.dart';

void main() {
  group('checkInメソッドのロジックテスト', () {
    test('メソッドコールでDateTimeが1件増加すること', () {
      final counter = Counter.init(name: 'counter');
    });
  });

  group('maxConsecutiveCountメソッドのロジックテスト', () {
    test('maxConsecutiveCountメソッドで初期化時には1が返却されること', () {});
    test('maxConsecutiveCountメソッドで任意のDateTimeが設定されており、3日連続が最大値の場合3が返却されること', () {});
  });
}
