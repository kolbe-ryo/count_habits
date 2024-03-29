import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAppearanceRepositoryProvider = Provider<AppearanceRepository>(
  (ref) => LocalAppearanceRepository(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  ),
);

class LocalAppearanceRepository implements AppearanceRepository {
  LocalAppearanceRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<Appearance> fetch({bool exception = false}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> reset({bool exception = false}) {
    // TODO: implement reset
    throw UnimplementedError();
  }

  @override
  Future<Appearance> update({int? colorId, int? fontFamilyId, bool exception = false}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
