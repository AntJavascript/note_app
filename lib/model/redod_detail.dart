import 'package:json_annotation/json_annotation.dart';

part 'redod_detail.g.dart';

@JsonSerializable()
class redod_detail extends Object {
  @JsonKey(name: 'access_token')
  dynamic accessToken;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'refresh_token')
  dynamic refreshToken;

  redod_detail(
    this.accessToken,
    this.code,
    this.count,
    this.data,
    this.msg,
    this.refreshToken,
  );

  factory redod_detail.fromJson(Map<String, dynamic> srcJson) =>
      _$redod_detailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$redod_detailToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'record_date')
  String recordDate;

  @JsonKey(name: 'record_date_unix')
  int recordDateUnix;

  @JsonKey(name: 'amount')
  num amount;

  @JsonKey(name: 'record_type')
  String recordType;

  @JsonKey(name: 'record_type_name')
  String recordTypeName;

  @JsonKey(name: 'remark')
  String remark;

  @JsonKey(name: 'account')
  String account;

  Data(
    this.id,
    this.type,
    this.recordDate,
    this.recordDateUnix,
    this.amount,
    this.recordType,
    this.recordTypeName,
    this.remark,
    this.account,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
