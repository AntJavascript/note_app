import 'package:json_annotation/json_annotation.dart';

part 'total_month_detail.g.dart';

@JsonSerializable()
class total_month_detail extends Object {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  total_month_detail(
    this.accessToken,
    this.code,
    this.data,
    this.msg,
    this.refreshToken,
  );

  factory total_month_detail.fromJson(Map<String, dynamic> srcJson) =>
      _$total_month_detailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$total_month_detailToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'day')
  int day;

  @JsonKey(name: 'month')
  int month;

  @JsonKey(name: 'amount')
  int amount;

  @JsonKey(name: 'type')
  String type;

  Data(
    this.day,
    this.month,
    this.amount,
    this.type,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
