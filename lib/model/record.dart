class RecordEntity {
/*
{
  "id": 1,
  "type": "expend",
  "record_date": "2023-09-12",
  "record_date_unix": 1695259929,
  "amount": 15.26,
  "record_type": "alipay",
  "remark": "备注",
  "account": "15888888888"
} 
*/

  int id;
  String type;
  String recordDate;
  int recordDateUnix;
  double amount;
  String recordType;
  String remark;
  String account;

  RecordEntity({
    this.id,
    this.type,
    this.recordDate,
    this.recordDateUnix,
    this.amount,
    this.recordType,
    this.remark,
    this.account,
  });
  RecordEntity.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    type = json['type']?.toString();
    recordDate = json['record_date']?.toString();
    recordDateUnix = json['record_date_unix']?.toInt();
    amount = json['amount']?.toDouble();
    recordType = json['record_type']?.toString();
    remark = json['remark']?.toString();
    account = json['account']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['record_date'] = recordDate;
    data['record_date_unix'] = recordDateUnix;
    data['amount'] = amount;
    data['record_type'] = recordType;
    data['remark'] = remark;
    data['account'] = account;
    return data;
  }
}
