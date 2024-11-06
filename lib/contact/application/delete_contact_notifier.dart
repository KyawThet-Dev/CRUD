import 'package:crud/core/domain/response_info_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_contact_notifier.freezed.dart';

@freezed
class DeleteContactState with _$DeleteContactState {
  const factory DeleteContactState.initial() = _Initial;
  const factory DeleteContactState.loading() = _Loading;
  const factory DeleteContactState.noConnection() = _NoConnection;
  const factory DeleteContactState.success(String success) = _Success;
  const factory DeleteContactState.error(ResponseInfoError error) = _Error;
}
