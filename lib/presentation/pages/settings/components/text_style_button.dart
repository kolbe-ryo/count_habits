import 'package:count_habits/application/usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/theme/text_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextStyleButton extends ConsumerWidget {
  const TextStyleButton({
    required this.index,
    super.key,
  });

  final int index;

  static const _text = '''
  AIによって21世紀はどのように変革していくのだろうか。
''';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.primaryContrastingColor,
            width: 2,
          ),
        ),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Text(
          _text,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 22,
            fontFamily: textSchemes[index],
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          final appearance = await ref.read(appearanceUsecaseProvider).update(fontFamilyId: index);
          ref.read(appearanceStateProvider.notifier).setFontFamily(appearance.fontFamilyId);
        },
      ),
    );
  }
}
