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

  /// Use this if user tap today`s counter
  List<DateTime> checkIn() {
    contributedAt.add(DateTime.now());
    return contributedAt;
  }

  /// 最大連続数を返却するgetter
  int get maxConsecutiveCount {
    if (contributedAt.isEmpty) {
      return 0;
    }

    // 最大値保持用の変数
    var maxConsecutiveCount = 1;

    // 一時保存用の変数
    var currentConsecutiveCount = 1;

    for (var i = 1; i < contributedAt.length; i++) {
      // 日付が連続している場合
      if (contributedAt[i].difference(contributedAt[i - 1]).inDays == 1) {
        currentConsecutiveCount++;
        continue;
      }
      // 日付が連続していない場合
      // 暫定最大値を超過している場合
      if (currentConsecutiveCount > maxConsecutiveCount) {
        maxConsecutiveCount = currentConsecutiveCount;
      }
      // 連続カウントをリセットする
      currentConsecutiveCount = 1;
    }
    return currentConsecutiveCount > maxConsecutiveCount ? currentConsecutiveCount : maxConsecutiveCount;
  }
}
