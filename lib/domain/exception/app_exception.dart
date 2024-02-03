class AppException implements Exception {
  const AppException([this.message = 'エラーが発生しました']);

  final String message;

  // TODO: ExceptionのEnumを設定し設定値として持つようにすること

  @override
  String toString() => message;
}
