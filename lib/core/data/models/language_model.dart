class LanguageModel {
  final String code;
  final String value;

  const LanguageModel({
    required this.code,
    required this.value,
  });
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageModel(code: 'ru', value: 'Russian'),
    LanguageModel(code: 'uz', value: 'Uzbek'),
    LanguageModel(code: 'en', value: 'English'),
  ];
}