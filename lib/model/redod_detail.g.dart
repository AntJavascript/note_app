// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redod_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

redod_detail _$redod_detailFromJson(Map<String, dynamic> json) => redod_detail(
      json['access_token'] as String,
      json['code'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['msg'] as String,
      json['refresh_token'] as String,
    );

Map<String, dynamic> _$redod_detailToJson(redod_detail instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
      'refresh_token': instance.refreshToken,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['type'] as String,
      json['record_date'] as String,
      json['record_date_unix'] as int,
      json['amount'] as num,
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
