import 'package:flutter/cupertino.dart';

Future<bool?> showDialog(BuildContext context) async {
  return showCupertinoDialog<bool?>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('削除しますか？'),
        content: const Text('この操作は元に戻せません'),
        actions: [
          CupertinoDialogAction(
            child: const Text('削除'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
