class UsertEntity {
/*
{
  "id": 1,
  "user_name": "LanFeng Xiao",
  "email": "15888888888",
  "phone": "15888888888@163.com",
  "status": 1
} 
*/

  int? id;
  String? userName;
  String? email;
  String? phone;
  int? status;

  UsertEntity({
    this.id,
    this.userName,
    this.email,
    this.phone,
    this.status,
  });
  UsertEntity.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userName = json['user_name']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    status = json['status']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}
