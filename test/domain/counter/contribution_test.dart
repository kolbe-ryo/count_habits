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
    test('一日前のcontributionがある場合、その日付はtrueで返却されること', () {
      final pastDateTime = DateTime.now().subtract(const Duration(days: 1));
      final contribution = Contribution(
        contributedAt: [
          pastDateTime,
        ],
      );
      final allDates = contribution.getAllDates;
      switch (pastDateTime.weekday) {
        case DateTime.sunday:
          expect(allDates.length, 1);
          expect(allDates.last, true);
          return;
        case DateTime.monday:
          expect(allDates.length, 2);
          expect(allDates.last, true);
          return;
        case DateTime.tuesday:
          expect(allDates.length, 3);
          expect(allDates.last, true);
          return;
        case DateTime.wednesday:
          expect(allDates.length, 4);
          expect(allDates.last, true);
          return;
        case DateTime.thursday:
          expect(allDates.length, 5);
          expect(allDates.last, true);
          return;
        case DateTime.friday:
          expect(allDates.length, 6);
          expect(allDates.last, true);
          return;
        case DateTime.saturday:
          expect(allDates.length, 7);
          expect(allDates.last, true);
          return;
      }
    });
    test('過去のcontributionがある場合、作成日とそれらの日付の間の数+曜日ずれだけfalseが返却されること', () {
      final pastDateTime1 = DateTime.now().subtract(const Duration(days: 10));
      final pastDateTime2 = DateTime.now().subtract(const Duration(days: 5));
      final contribution = Contribution(
        contributedAt: [
          pastDateTime1,
          pastDateTime2,
        ],
      );
      // 本日から10日前と5日前に2回のcontributionが存在するので、8日の間が存在し、日曜からずれた分だけ加算される
      final allDates = contribution.getAllDates;
      switch (DateTime.now().weekday) {
        case DateTime.sunday:
          expect(allDates.where((e) => !e).length, 8 + 0);
          return;
        case DateTime.monday:
          expect(allDates.where((e) => !e).length, 8 + 1);
          return;
        case DateTime.tuesday:
          expect(allDates.where((e) => !e).length, 8 + 2);
          return;
        case DateTime.wednesday:
          expect(allDates.where((e) => !e).length, 8 + 3);
          return;
        case DateTime.thursday:
          expect(allDates.where((e) => !e).length, 8 + 4);
          return;
        case DateTime.friday:
          expect(allDates.where((e) => !e).length, 8 + 5);
          return;
        case DateTime.saturday:
          expect(allDates.where((e) => !e).length, 8 + 6);
          return;
      }
    });
  });
}
