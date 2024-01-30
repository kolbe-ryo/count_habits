import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    required String id,
    required List<DateTime> contributedAt,
  }) = _Contribution;

  /// Use this for initializing Contribution
  /// id is the same of Counter one
  factory Contribution.init({
    required String id,
  }) {
    return Contribution(
      id: id,
      contributedAt: [DateTime.now()],
    );
  }

  factory Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);
}
