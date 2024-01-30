import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepositoryProvider = Provider<CounterRepository>((ref) => throw UnimplementedError());

abstract interface class CounterRepository {
  Future<List<Counter>> fetchAll();

  Future<Counter> update({
    required int id,
    String? name,
  });

  Future<void> delete(int id);
}
