import 'package:count_habits/application/state/app_loading_state_provider.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/util/constants/logger.dart';

mixin AsyncExecuteMixin {
  Future<T> execute<T>({
    required AppLoadingState? appLoadingState,
    required Future<T> Function() action,
  }) async {
    // appLoadingStateを渡さない場合は、通常の非同期処理を行う
    if (appLoadingState == null) {
      try {
        return await action();
      } on AppException catch (e) {
        logger.i(e);
        rethrow;
      }
    }

    // appLoadingStateを渡す場合は、ローディング表示の非同期処理を行う
    appLoadingState.startLoading();
    try {
      return await action();
    } on AppException catch (e) {
      logger.i(e);
      rethrow;
    } finally {
      appLoadingState.comleteLoading();
    }
  }
}
