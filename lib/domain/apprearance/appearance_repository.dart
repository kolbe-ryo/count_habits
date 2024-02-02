import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appearanceRepositoryProvider = Provider<AppearanceRepository>((ref) => throw UnimplementedError());

abstract interface class AppearanceRepository {
  Future<Appearance> fetch();

  Future<Appearance> update({
    int? colorId,
    String? fontFamily,
  });

  Future<void> reset();
}
