part of 'language_bloc.dart';
class LanguageState extends Equatable {
  const LanguageState({
    Locale? locale,
  }) : locale = locale ?? const Locale('uz');

  final Locale locale;

  @override
  List<Object> get props => [locale];

  LanguageState copyWith({Locale? locale}) {
    return LanguageState(
      locale: locale,
    );
  }
}