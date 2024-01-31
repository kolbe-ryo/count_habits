import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appearanceRepositoryProvider = Provider<AppearanceRepository>((ref) => throw UnimplementedError());

abstract interface class AppearanceRepository {
  Future<List<Counter>> fetch();

  Future<Counter> update({
    int? colorId,
    String? fontFamily,
  });

  Future<void> reset();
}
