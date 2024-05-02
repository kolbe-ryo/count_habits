import 'package:count_habits/util/constants/const_text.dart';

enum AppExceptionEnum {
  defaultException(message: 'エラーが発生しました'),
  unexpectedException(message: '予期せぬエラーが発生しました'),
  counterCreate(message: 'カウンタの作成$defaultText'),
  counterFetchAll(message: 'カウンタの取得$defaultText'),
  counterUpdate(message: 'カウンタの更新$defaultText'),
  counterDelete(message: 'カウンタの削除$defaultText'),
  counterInvalid(message: 'カウンタ名が空です'),
  counterCheckIn(message: 'カウントアップに失敗しました'),
  appearanceCreate(message: 'テーマの作成$defaultText'),
  appearanceFetch(message: 'テーマの取得$defaultText'),
  appearanceUpdate(message: 'テーマの更新$defaultText'),
  appearanceReset(message: 'テーマのリセット$defaultText'),

  // Billing Exception
  billingCustomer(message: '課金情報の取得$defaultText');

  const AppExceptionEnum({required this.message});

  final String message;
}
