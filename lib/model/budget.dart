class BudgetEntity {

  int id;
  double amount;
  String account;
  String? accessToken;
  String? refreshToken;

  BudgetEntity({
    this.id,
    this.amount,
    this.account,
    this.accessToken,
    this.refreshToken,
  });
  BudgetEntity.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    amount = json['amount']?.toDouble();
    account = json['account']?.toString();
    accessToken = json['access_token']?.toString();
    refreshToken = json['refresh_token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['account'] = account;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
