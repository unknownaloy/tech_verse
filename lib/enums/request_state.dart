import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';


@freezed
class RequestState with _$RequestState {
  const factory RequestState.idle() = Idle;
  const factory RequestState.loading() = Loading;
  const factory RequestState.success() = Success;
  const factory RequestState.error([String? message]) = Error;
}