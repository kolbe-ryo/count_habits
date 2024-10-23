import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/inflastructure/local/local_appearance_repository.dart';
import 'package:count_habits/inflastructure/local/local_counter_repository.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:count_habits/presentation/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Test Flight

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        // モックテストの時はこちらを利用する
        // appearanceRepositoryProvider.overrideWithValue(MockAppearanceRepository()),
        // counterRepositoryProvider.overrideWithValue(MockCounterRepository()),
        appearanceRepositoryProvider.overrideWith(
          (ref) => LocalAppearanceRepository(
            sharedPreferences: ref.watch(sharedPreferencesProvider),
          ),
        ),
        counterRepositoryProvider.overrideWith(
          (ref) => LocalCounterRepository(
            sharedPreferences: ref.watch(sharedPreferencesProvider),
          ),
        ),
        sharedPreferencesProvider.overrideWithValue(await SharedPreferences.getInstance()),
      ],
      child: const Habits365(),
    ),
  );
}
