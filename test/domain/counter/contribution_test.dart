import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:test/test.dart';

void main() {
  group('Contribution Objectのinitインスタンスのテスト', () {
    test('checkIn関数によってDateTimeが1つ存在し、インスタンス作成日と一致すること', () {
      final contribution = Contribution.init();
      final datetimeNow = DateTime.now();
      expect(contribution.contributedAt.length, 1);
      expect(contribution.contributedAt.first.difference(datetimeNow).inDays == 0, true);
    });
  });
  group('Contribution getAllDatesのテスト', () {
    test('contributionがない場合、空のリストを返却する', () {
      const contribution = Contribution(contributedAt: []);
      expect(contribution.getAllDates.isEmpty, true);
    });

    test('contributionがない場合、空のリストを返却する', () {});
    test('contributionがない場合、空のリストを返却する', () {});
    test('contributionがない場合、空のリストを返却する', () {});
  });
}
