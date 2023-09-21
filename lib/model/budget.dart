class BudgetEntity {
/*
{
  "id": 1,
  "amount": 15.26,
  "account": "15888888888"
} 
*/

  int id;
  double amount;
  String account;

  BudgetEntity({
    this.id,
    this.amount,
    this.account,
  });
  BudgetEntity.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    amount = json['amount']?.toDouble();
    account = json['account']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['account'] = account;
    return data;
  }
}
