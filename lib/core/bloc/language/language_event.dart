import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.langCode});
  final String langCode;

  @override
  List<Object> get props => [langCode];
}

class GetLanguage extends LanguageEvent {} // Add this
