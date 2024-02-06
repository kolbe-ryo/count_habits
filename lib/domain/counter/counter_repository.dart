import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepositoryProvider = Provider<CounterRepository>((ref) => throw UnimplementedError());

abstract interface class CounterRepository {
  Future<List<Counter>> fetchAll({bool exception = false});

  Future<Counter> update({
    required String id,
    required String name,
    bool exception = false,
  });

  Future<List<Counter>> delete(
    String id, {
    bool exception = false,
  });

  Future<Counter> checkIn(
    String id, {
    bool exception = false,
  });
}
