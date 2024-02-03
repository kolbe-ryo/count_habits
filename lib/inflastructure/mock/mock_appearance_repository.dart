import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';

class MockAppearanceRepository implements AppearanceRepository {
  @override
  Future<Appearance> fetch([bool? exception]) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException(AppExceptionEnum.appearanceFetch);
    }
    return const Appearance(
      colorId: 1,
      fontFamily: 'Hachi_Maru_Pop',
    );
  }

  @override
  Future<Appearance> update({
    int? colorId,
    String? fontFamily,
    bool? exception,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException(AppExceptionEnum.appearanceUpdate);
    }
    const initAppearance = Appearance();
    return Appearance(
      colorId: colorId ?? initAppearance.colorId,
      fontFamily: fontFamily ?? initAppearance.fontFamily,
    );
  }

  @override
  Future<Appearance> reset([bool? exception]) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException(AppExceptionEnum.appearanceReset);
    }
    return const Appearance();
  }
}
