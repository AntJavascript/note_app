import 'package:json_annotation/json_annotation.dart';

part 'record_model.g.dart';

@JsonSerializable()
class record_model extends Object {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  record_model(
    this.accessToken,
    this.code,
    this.count,
    this.data,
    this.msg,
    this.refreshToken,
  );

  factory record_model.fromJson(Map<String, dynamic> srcJson) =>
      _$record_modelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$record_modelToJson(this);
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
  int amount;

  @JsonKey(name: 'record_type')
  String recordType;

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
    this.remark,
    this.account,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
