import 'dart:ui';

import 'package:afisha_market/core/data/models/language_model.dart';
import 'package:afisha_market/core/utils/local_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) {
    emit(state.copyWith(locale: Locale(event.langCode)));
  }
  onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    final selectedLanguage =LocalStorage.instance.getLanguage();
    emit(state.copyWith(
      locale: selectedLanguage != null
          ? Locale(selectedLanguage)
          : const Locale('uz'),
    ));
  }
}
