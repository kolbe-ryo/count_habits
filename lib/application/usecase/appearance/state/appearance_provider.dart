import 'package:count_habits/application/usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Appearance> appearance(AppearanceRef ref) async => ref.read(appearanceUsecaseProvider).fetch();
