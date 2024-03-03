import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_loading_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLoading extends _$AppLoading {
  @override
  bool build() => false;

  void startLoading() => state = true;

  void comleteLoading() => state = false;
}
