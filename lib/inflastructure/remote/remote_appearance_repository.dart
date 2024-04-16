import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';

class RemoteAppearanceRepository implements AppearanceRepository {
  @override
  Future<Appearance> fetch({bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<void> reset({bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<Appearance> update({int? colorId, int? fontFamilyId, bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<void> create({bool exception = false}) {
    throw UnimplementedError();
  }
}
