import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:count_habits/inflastructure/mock/mock_appearance_repository.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
import 'package:count_habits/presentation/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(
    ProviderScope(
      overrides: [
        appearanceRepositoryProvider.overrideWithValue(MockAppearanceRepository()),
        counterRepositoryProvider.overrideWithValue(MockCounterRepository()),
        sharedPreferencesProvider.overrideWithValue(await SharedPreferences.getInstance()),
      ],
      child: const Habits365(),
    ),
  );
}
