// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterImpl _$$CounterImplFromJson(Map<String, dynamic> json) =>
    _$CounterImpl(
      title: json['title'] as String,
      count: json['count'] as int,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CounterImplToJson(_$CounterImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'count': instance.count,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
