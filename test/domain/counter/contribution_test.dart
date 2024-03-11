import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:test/test.dart';

void main() {
  group('Contribution Objectのinitインスタンスのテスト', () {
    test('checkIn関数によってDateTimeが1つ存在し、インスタンス作成日と一致すること', () {
      final counter = Counter.init(name: 'test');
      expect(counter.contribution.contributedAt.length, 0);

      final chechInCounter = counter.checkIn;
      final datetimeNow = DateTime.now();
      expect(chechInCounter.contribution.contributedAt.length, 1);
      expect(chechInCounter.contribution.contributedAt.first.difference(datetimeNow).inDays == 0, true);
    });
  });
  group('Contribution getAllDatesのテスト', () {
    test('カウンタ作成時には、全てfalseのリストを返却する（テスト日が日曜日の場合長さ1のリスト）', () {
      const contribution = Contribution(contributedAt: []);
      expect(contribution.getAllDates.isEmpty, true);
    });

    test('contributionがない場合、空のリストを返却する', () {});
    test('contributionがない場合、空のリストを返却する', () {});
    test('contributionがない場合、空のリストを返却する', () {});
  });
}
