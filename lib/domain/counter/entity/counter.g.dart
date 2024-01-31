// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterImpl _$$CounterImplFromJson(Map<String, dynamic> json) =>
    _$CounterImpl(
      id: json['id'] as String,
      counterValue:
          CounterValue.fromJson(json['counterValue'] as Map<String, dynamic>),
      contribution:
          Contribution.fromJson(json['contribution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CounterImplToJson(_$CounterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'counterValue': instance.counterValue,
      'contribution': instance.contribution,
    };
