import 'package:alan/alan.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'std_tx.g.dart';

/// Contains the information about a standard transaction that can be
/// sent to the chain using a full node.
@JsonSerializable(explicitToJson: true)
class StdTx extends Equatable {
  @JsonKey(name: 'msg')
  final List<StdMsg> messages;

  @JsonKey(name: 'fee')
  final StdFee fee;

  @JsonKey(name: 'signatures')
  final List<StdSignature> signatures;

  @JsonKey(name: 'memo')
  final String memo;

  StdTx({
    @required this.messages,
    @required this.signatures,
    @required this.fee,
    @required this.memo,
  }) : assert(signatures == null || signatures.isNotEmpty);

  @override
  List<Object> get props => [memo, fee, signatures, memo];

  factory StdTx.fromJson(Map<String, dynamic> json) => _$StdTxFromJson(json);

  Map<String, dynamic> toJson() => _$StdTxToJson(this);
}
