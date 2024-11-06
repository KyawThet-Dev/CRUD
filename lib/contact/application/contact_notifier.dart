import 'package:crud/contact/infrastructure/contact_remote_service.dart';
import 'package:crud/core/domain/response_info_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/contact.dart';
part 'contact_notifier.freezed.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;
  const factory ContactState.loading() = _Loading;
  const factory ContactState.noConnection() = _NoConnection;
  const factory ContactState.empty() = _Empty;
  const factory ContactState.success(List<Contact> contacts) = _Success;
  const factory ContactState.error(ResponseInfoError error) = _Error;
}

class ContactNotifier extends StateNotifier<ContactState> {
  final ContactRemoteService _remoteService;
  ContactNotifier(this._remoteService) : super(const ContactState.initial());

  Future<void> getContacts() async {
    state = const ContactState.loading();
    final result = await _remoteService.getContacts();
    state = result.fold(
      (l) => ContactState.error(l),
      (r) => r.when(
        noConnection: ContactState.noConnection,
        result: (data) => data.isEmpty
            ? const ContactState.empty()
            : ContactState.success(data),
      ),
    );
  }
}
