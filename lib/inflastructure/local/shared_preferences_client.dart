import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ProviderScopeでoverrideしているので、Unimplementになることはない
final sharedPreferencesProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());

const keyCounter = 'counter';

const keyAppearance = 'appearance';
