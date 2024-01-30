// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContributionImpl _$$ContributionImplFromJson(Map<String, dynamic> json) =>
    _$ContributionImpl(
      id: json['id'] as String,
      contributedAt: (json['contributedAt'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$ContributionImplToJson(_$ContributionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contributedAt':
          instance.contributedAt.map((e) => e.toIso8601String()).toList(),
    };
