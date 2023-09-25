import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class login_model extends Object {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  String data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  login_model(
    this.accessToken,
    this.code,
    this.data,
    this.msg,
    this.refreshToken,
  );

  factory login_model.fromJson(Map<String, dynamic> srcJson) =>
      _$login_modelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$login_modelToJson(this);
}
