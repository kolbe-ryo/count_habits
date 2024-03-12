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
    test('カウンタ作成時には、作成日を含まない全てfalseのリストを返却する（テスト日が日曜の場合は長さ0のリスト）', () {
      const contribution = Contribution();
      final allDates = contribution.getAllDates;
      switch (DateTime.now().weekday) {
        case DateTime.sunday:
          expect(allDates.length, 0);
          expect(allDates.any((element) => element), false);
          return;
        case DateTime.monday:
          expect(allDates.length, 1);
          expect(allDates.any((element) => element), false);
          return;
        case DateTime.tuesday:
          expect(allDates.length, 2);
          expect(allDates.any((element) => element), false);
          return;
        case DateTime.wednesday:
          expect(allDates.length, 3);
          expect(allDates.any((element) => element), false);
          return;
        case DateTime.thursday:
          expect(allDates.length, 4);
          expect(allDates.any((element) => element), false);
          return;
        case DateTime.friday:
          expect(allDates.length, 5);
          expect(allDates.any((element) => element), false);
          return;
        case DateTime.saturday:
          expect(allDates.length, 6);
          expect(allDates.any((element) => element), false);
          return;
      }
    });
    test('過去のcontributionがある場合、それらの日付はtrueで返却されること', () {});
    test('過去のcontributionがある場合、作成日とそれらの日付の間の数だけfalseが返却されること', () {});
  });
}
