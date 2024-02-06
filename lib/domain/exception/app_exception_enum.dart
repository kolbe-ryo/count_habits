import 'package:count_habits/util/constants/const_text.dart';

enum AppExceptionEnum {
  defaultException(message: 'エラーが発生しました'),
  unexpectedException(message: '予期せぬエラーが発生しました'),
  counterFetchAll(message: 'カウンタの取得$defaultText'),
  counterUpdate(message: 'カウンタの更新$defaultText'),
  counterDelete(message: 'カウンタの削除$defaultText'),
  counterInvalid(message: 'カウンタ名が空です'),
  counterCheckIn(message: 'カウントアップに失敗しました'),
  appearanceFetch(message: 'テーマの取得$defaultText'),
  appearanceUpdate(message: 'テーマの更新$defaultText'),
  appearanceReset(message: 'テーマのリセット$defaultText');

  const AppExceptionEnum({required this.message});

  final String message;
}
