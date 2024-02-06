import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';

class MockAppearanceRepository implements AppearanceRepository {
  Appearance _appearance = const Appearance();

  Appearance get appearance => _appearance;

  @override
  Future<Appearance> fetch({bool exception = false}) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.appearanceFetch);
    }
    return _appearance;
  }

  @override
  Future<Appearance> update({
    int? colorId,
    String? fontFamily,
    bool exception = false,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.appearanceUpdate);
    }
    const initAppearance = Appearance();
    return _appearance.copyWith(
        colorId: colorId ?? initAppearance.colorId, fontFamily: fontFamily ?? initAppearance.fontFamily);
  }

  @override
  Future<void> reset({bool exception = false}) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.appearanceReset);
    }
    _appearance = const Appearance();
  }
}
