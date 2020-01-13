import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:sacco/models/export.dart';

part 'account_data.g.dart';

/// Contains the data that is returned from a full node when querying
/// for the /auth/accounts/{address} REST API endpoint.
@JsonSerializable(explicitToJson: true)
class AccountData extends Equatable {
  @JsonKey(name: "account_number")
  final String accountNumber;

  @JsonKey(name: "sequence")
  final String sequence;

  @JsonKey(name: "coins")
  final List<StdCoin> coins;

  AccountData({
    @required this.accountNumber,
    @required this.sequence,
    @required this.coins,
  })  : assert(accountNumber != null),
        assert(sequence != null),
        assert(coins != null);

  @override
  String toString() {
    return "number: $accountNumber, sequence: $sequence, coins: $coins";
  }


  @override
  List<Object> get props => [accountNumber, sequence, coins];

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}