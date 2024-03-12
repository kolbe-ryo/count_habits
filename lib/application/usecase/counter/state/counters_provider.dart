import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counters_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Counter>> counters(CountersRef ref) async {
  // 記事一覧をデータベースから取得する処理

  // エラーを意図的に発生させることが可能（Mock化してもいいかもしれない）
  // throw AsyncValue.error(
  //   const AppException(),
  //   StackTrace.fromString('error'),
  // );

  return ref.read(counterUsecaseProvider).fetchAll();
}
