class LoginEntity {
  String? accessToken;
  int? code;
  String? data;
  String? msg;
  String? refreshToken;

  LoginEntity({
    this.accessToken,
    this.code,
    this.data,
    this.msg,
    this.refreshToken,
  });
  LoginEntity.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token']?.toString();
    code = json['code']?.toInt();
    data = json['data']?.toString();
    msg = json['msg']?.toString();
    refreshToken = json['refresh_token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['code'] = code;
    data['data'] = this.data;
    data['msg'] = msg;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
