import 'package:flutter/cupertino.dart';

Future<bool?> showCustomDialog(BuildContext context) async {
  return showCupertinoDialog<bool?>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('削除しますか？'),
        content: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('この操作は元に戻せません'),
        ),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('削除'),
            onPressed: () => Navigator.pop(context, true),
          ),
          CupertinoDialogAction(
            child: const Text('キャンセル'),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      );
    },
  );
}
