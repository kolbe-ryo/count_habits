import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/util/constants/logger.dart';

mixin AsyncExecuteMixin {
  Future<T> execute<T>({required Future<T> Function() action}) async {
    try {
      return await action();
    } on AppException catch (e) {
      logger.i(e);
      rethrow;
    }
  }
}
