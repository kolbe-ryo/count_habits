import 'package:count_habits/application/usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_data_provider.g.dart';

@Riverpod(keepAlive: true)
Future<InitialData> initialData(InitialDataRef ref) async {
  // 記事一覧をデータベースから取得する処理

  final counters = await ref.read(counterUsecaseProvider).fetchAll();

  final appearance = await ref.read(appearanceUsecaseProvider).fetch();

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
