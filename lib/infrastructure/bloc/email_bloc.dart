import 'dart:async';
import 'package:nitish_kumar_portfolio/infrastructure/api/email_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_event.dart';

part 'email_state.dart';

part 'email_bloc.freezed.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailState get initialState => EmailState.initial();

  EmailBloc(this._emailRepository) : super(EmailState.initial()) {
    on<SendEmail>(_onSendEmail);
  }

  Future<void> _onSendEmail(
    SendEmail event,
    Emitter<EmailState> emit,
  ) async {
    emit(EmailState.sendingEmail());
    
    final response = await _emailRepository.sendEmail(
      name: event.name,
      email: event.email,
      subject: event.subject,
      message: event.message,
    );

    response.fold(
      (failure) {
        emit(EmailState.failure());
      },
      (data) {
        emit(EmailState.emailSentSuccessFully());
      },
    );
  }
}
