// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

total_model _$total_modelFromJson(Map<String, dynamic> json) => total_model(
      json['code'] as int,
      json['data'] as String,
      json['expendCount'] as int,
      json['incomeCount'] as int,
      json['msg'] as String,
      json['access_token'] as dynamic,
      json['refresh_token'] as dynamic,
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
