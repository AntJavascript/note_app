class CommonEntity {
/*
{
  "data": "",
  "msg": "ok",
  "code": "200"
} 
*/

  String? data;
  String? msg;
  String? code;

  CommonEntity({
    this.data,
    this.msg,
    this.code,
  });
  CommonEntity.fromJson(Map<String, dynamic> json) {
    data = json['data']?.toString();
    msg = json['msg']?.toString();
    code = json['code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    data['msg'] = msg;
    data['code'] = code;
    return data;
  }
}
