// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

record_model _$record_modelFromJson(Map<String, dynamic> json) => record_model(
      json['access_token'],
      json['code'] as int,
      json['count'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['msg'] as String,
      json['refresh_token'],
    );

Map<String, dynamic> _$record_modelToJson(record_model instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'code': instance.code,
      'count': instance.count,
      'data': instance.data,
      'msg': instance.msg,
      'refresh_token': instance.refreshToken,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['type'] as String,
      json['record_date'] as String,
      json['record_date_unix'] as int,
      json['amount'] as int,
      json['record_type'] as String,
      json['record_type_name'] as String,
      json['remark'] as String,
      json['account'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'record_date': instance.recordDate,
      'record_date_unix': instance.recordDateUnix,
      'amount': instance.amount,
      'record_type': instance.recordType,
      'record_type_name': instance.recordTypeName,
      'remark': instance.remark,
      'account': instance.account,
    };
