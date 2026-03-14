part of 'payment_bloc.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  factory PaymentState({
    @Default(PaymentStatus.initial) PaymentStatus status,
    List<String>? productIds,
    String? message,
  }) = _PaymentState;
}
