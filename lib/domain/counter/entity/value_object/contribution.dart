import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    required List<DateTime> contributedAt,
  }) = _Contribution;

  const Contribution._();

  /// Use this for initializing Contribution
  factory Contribution.init() => Contribution(contributedAt: [DateTime.now()]);

  factory Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

  List<bool> get getAllDates {
    final customCountribute = contributedAt.isNotEmpty ? contributedAt : [DateTime.now()];

    final DateTime firstDate;

    // 最初のカウント日が日曜の場合はそのまま使用する
    if (customCountribute.first.weekday == DateTime.sunday) {
      firstDate = customCountribute.first;
    } else {
      firstDate = customCountribute.first.subtract(Duration(days: customCountribute.first.weekday));
    }

    final lastDate = customCountribute.last;

    // 開始日から終了日まででcontributeされている順にtrueを返却するリストを作成
    final allDates = <bool>[];
    for (var date = firstDate; !date.isAfter(lastDate); date = date.add(const Duration(days: 1))) {
      contributedAt.contains(date) ? allDates.add(true) : allDates.add(false);
    }

    return allDates;
  }
}
