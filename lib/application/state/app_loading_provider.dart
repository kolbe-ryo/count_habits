import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_loading_provider.g.dart';

@riverpod
bool appLoading(AppLoadingRef ref) => false;
