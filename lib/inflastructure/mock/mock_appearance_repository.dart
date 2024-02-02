import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';

class MockAppearanceRepository implements AppearanceRepository {
  @override
  Future<Appearance> fetch() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return const Appearance(
      colorId: 1,
      fontFamily: 'Hachi_Maru_Pop',
    );
  }

  @override
  Future<Appearance> update({
    int? colorId,
    String? fontFamily,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return Appearance(
      colorId: colorId ?? 0,
      fontFamily: fontFamily,
    );
  }

  @override
  Future<Appearance> reset() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return Appearance.init();
  }
}
