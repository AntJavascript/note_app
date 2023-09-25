// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

login_model _$login_modelFromJson(Map<String, dynamic> json) => login_model(
      json['access_token'] as String,
      json['code'] as int,
      json['data'] as String,
      json['msg'] as String,
      json['refresh_token'] as String,
    );

Map<String, dynamic> _$login_modelToJson(login_model instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
      'refresh_token': instance.refreshToken,
    };
