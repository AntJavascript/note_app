import 'package:json_annotation/json_annotation.dart';

part 'total_model.g.dart';

@JsonSerializable()
class total_model extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  String data;

  @JsonKey(name: 'expendCount')
  num expendCount;

  @JsonKey(name: 'incomeCount')
  num incomeCount;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'access_token')
  dynamic accessToken;

  @JsonKey(name: 'refresh_token')
  dynamic refreshToken;

  total_model(
    this.code,
    this.data,
    this.expendCount,
    this.incomeCount,
    this.msg,
    this.accessToken,
    this.refreshToken,
  );

  factory total_model.fromJson(Map<String, dynamic> srcJson) =>
      _$total_modelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$total_modelToJson(this);
}
