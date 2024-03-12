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
    test('カウンタ作成時には、作成日を含まない全てfalseのリストを返却する（テスト日が日曜日の以外場合）', () {
      const contribution = Contribution(contributedAt: []);
      expect(contribution.getAllDates.isEmpty, true);
    });

    test('カウンタ作成時には、空のリストを返却する（テスト日が日曜日の場合）', () {});
    test('過去のcontributionがある場合、その日付はtrueで返却されること', () {});
  });
}
