import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionModel {
  ///"user_id": 4,
    // "vip_id": 1,
    // "amount": "99.000",
    // "code": "XkrE9PlEnAOT",
    // "status": 1,
    // "createdAt": "2022-07-13T16:49:05.000Z",
    // "updatedAt": "2022-07-13T16:49:05.000Z",
    // "id": 5
  ///
  int? user_id;
  int? vip_id;
  String? amount;
  String? code;
  int? status;
  int?  id;
  TransactionModel({this.amount, this.code, this.id, this.status, this.user_id, this.vip_id});
   factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}