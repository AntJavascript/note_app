// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_month_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

total_month_detail _$total_month_detailFromJson(Map<String, dynamic> json) =>
    total_month_detail(
      json['access_token'] as String,
      json['code'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['msg'] as String,
      json['refresh_token'] as String,
    );

Map<String, dynamic> _$total_month_detailToJson(total_month_detail instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
      'refresh_token': instance.refreshToken,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['day'] as int,
      json['month'] as int,
      json['amount'] as int,
      json['type'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'amount': instance.amount,
      'type': instance.type,
    };
