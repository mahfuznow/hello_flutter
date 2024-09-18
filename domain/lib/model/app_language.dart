enum AppLanguage {
  en,
  nb;

  @override
  String toString() {
    switch (this) {
      case AppLanguage.en:
        return 'en';
      case AppLanguage.nb:
        return 'nb';
    }
  }

  factory AppLanguage.fromString(String value) {
    switch (value) {
      case 'en':
        return AppLanguage.en;
      case 'nb':
        return AppLanguage.nb;
      default:
        throw ArgumentError('Invalid AppLanguage: $value');
    }
  }
}
