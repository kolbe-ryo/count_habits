import 'package:count_habits/domain/exception/app_exception_enum.dart';

class AppException implements Exception {
  const AppException([this.exceptionEnum = AppExceptionEnum.defaultException]);

  final AppExceptionEnum exceptionEnum;

  @override
  String toString() => exceptionEnum.message;
}
