import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_loading_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLoadingState extends _$AppLoadingState {
  @override
  bool build() => false;

  bool get loadingState => state;

  void startLoading() => state = true;

  void comleteLoading() => state = false;
}
