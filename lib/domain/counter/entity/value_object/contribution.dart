import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    @Default([]) List<DateTime> contributedAt,
  }) = _Contribution;

  const Contribution._();

  factory Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

  List<bool> get getAllDates {
    final isInitial = contributedAt.isEmpty;

    // 初回追加時は空のリストになるので、擬似的に初日を追加する
    final now = DateTime.now();
    final customContribution = isInitial ? [DateTime(now.year, now.month, now.day)] : contributedAt;

    final DateTime firstDate;

    // 最初のカウント日が日曜の場合はそのまま使用する
    if (customContribution.first.weekday == DateTime.sunday) {
      firstDate = customContribution.first;
    } else {
      firstDate = customContribution.first.subtract(Duration(days: customContribution.first.weekday));
    }

    final lastDate = customContribution.last;

    // 開始日から終了日まででcontributeされている順にtrueを返却するリストを作成
    final allDates = <bool>[];
    for (var date = firstDate; !date.isAfter(lastDate); date = date.add(const Duration(days: 1))) {
      // カウンタ追加初日は、カウントアップするまでは空なのでfalseであること
      if (isInitial) {
        allDates.add(false);
      } else {
        contributedAt.contains(date) ? allDates.add(true) : allDates.add(false);
      }
    }

    // 最初のカウンタはカウントアップ後に追加するので一旦削除する
    if (isInitial) {
      allDates.removeLast();
      return allDates;
    }
    return allDates;
  }
}
