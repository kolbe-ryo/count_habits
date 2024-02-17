import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final appearanceRepositoryProvider = Provider<AppearanceRepository>((ref) => throw UnimplementedError());

abstract interface class AppearanceRepository {
  // TODO:  AppearanceのListを取得すること
  Future<Appearance> fetch({bool exception = false});

  Future<Appearance> update({
    int? colorId,
    String? fontFamily,
    bool exception = false,
  });

  Future<void> reset({bool exception = false});
}
