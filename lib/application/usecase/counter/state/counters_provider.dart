import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counters_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Counter>> counters(CountersRef ref) async {
  // 記事一覧をデータベースから取得する処理
  return ref.read(counterUsecaseProvider).fetchAll();
}

// @Riverpod(keepAlive: true)
// class Counters extends _$Counters {
//   @override
//   List<Counter> build() => [];

//   // ignore: avoid_setters_without_getters
//   set setCounters(List<Counter> counters) => state = counters;

//   void setCounter(Counter counter) {
//     final newCounters = state.map((e) => e.id == counter.id ? counter : e).toList();
//     state = newCounters;
//   }

//   void deleteCounter(Counter deleteCounter) {
//     state = [
//       for (final counter in state)
//         if (counter.id != deleteCounter.id) counter,
//     ];
//   }

//   Counter getCounter(String id) {
//     final counter = state.firstWhereOrNull((element) => element.id == id);
//     if (counter == null) {
//       throw const AppException(AppExceptionEnum.unexpectedException);
//     }
//     return counter;
//   }
// }
