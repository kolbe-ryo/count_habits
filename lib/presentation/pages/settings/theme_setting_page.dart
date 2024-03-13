import 'package:count_habits/presentation/pages/settings/components/color_style_button.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO レイアウトを調整すること
class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // const Text('Text'),
        // Wrap(
        //   children: List.generate(
        //     textSchemes.length,
        //     (index) {
        //       return Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           CupertinoSwitch(
        //             activeColor: theme.primaryColor,
        //             value: index == ref.watch(appearanceStateProvider.select((value) => value.fontFamilyId)),
        //             onChanged: (value) {
        //               ref.read(appearanceStateProvider.notifier).setFontFamily(index);
        //             },
        //           ),
        //           Text('$index'),
        //         ],
        //       );
        //     },
        //   ),
        // ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          padding: EdgeInsets.zero,
          children: colorSchemes.entries
              .map(
                (e) => ColorStyleButton(
                  theme: e.value,
                  index: e.key,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
