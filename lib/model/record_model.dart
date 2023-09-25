import 'package:json_annotation/json_annotation.dart'; 
  
part 'record_model.g.dart';


@JsonSerializable()
  class record_model extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  String code;

  record_model(this.data,this.msg,this.code,);

  factory record_model.fromJson(Map<String, dynamic> srcJson) => _$record_modelFromJson(srcJson);

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
  double amount;

  @JsonKey(name: 'record_type')
  String recordType;

  @JsonKey(name: 'remark')
  String remark;

  @JsonKey(name: 'account')
  String account;

  Data(this.id,this.type,this.recordDate,this.recordDateUnix,this.amount,this.recordType,this.remark,this.account,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}
