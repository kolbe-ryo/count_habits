class ValidatorException implements Exception {
  const ValidatorException([this.message = 'エラーが発生しました']);

  final String message;

  @override
  String toString() => message;
}
