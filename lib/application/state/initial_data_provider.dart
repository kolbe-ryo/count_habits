import 'package:count_habits/application/usecase/appearance/state/appearance_provider.dart';
import 'package:count_habits/application/usecase/counter/state/counters_provider.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_data_provider.g.dart';

@Riverpod(keepAlive: true)
Future<InitialData> initialData(InitialDataRef ref) async {
  final counters = await ref.watch(countersProvider.future);
  final appearance = await ref.watch(appearanceProvider.future);
  return InitialData(counters: counters, appearance: appearance);
}

class InitialData {
  const InitialData({
    required this.counters,
    required this.appearance,
  });
  final List<Counter> counters;
  final Appearance appearance;
}
