import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    @Default(0) int maxCount,
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
}
