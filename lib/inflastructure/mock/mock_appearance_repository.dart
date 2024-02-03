import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/exception/app_exception.dart';

class MockAppearanceRepository implements AppearanceRepository {
  @override
  Future<Appearance> fetch([bool? exception]) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException('テーマの取得に失敗しました');
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
      throw const AppException('テーマの更新に失敗しました');
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
      throw const AppException('テーマのリセットに失敗しました');
    }
    return const Appearance();
  }
}
