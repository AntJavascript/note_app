// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

total_model _$total_modelFromJson(Map<String, dynamic> json) => total_model(
      json['code'] as int,
      json['data'] as String,
      json['expendCount'] as num,
      json['incomeCount'] as num,
      json['msg'] as String,
      json['access_token'],
      json['refresh_token'],
    );

Map<String, dynamic> _$total_modelToJson(total_model instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'expendCount': instance.expendCount,
      'incomeCount': instance.incomeCount,
      'msg': instance.msg,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
