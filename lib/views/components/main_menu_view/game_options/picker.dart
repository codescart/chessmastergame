import 'package:flutter/cupertino.dart';

import '../../shared/text_variable.dart';

class Picker<T> extends StatelessWidget {
  final String label;
  final Map<T, Text> options;
  final T selection;
  final Function setFunc;

  const Picker(
      {Key key, this.label, this.options, this.selection, this.setFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextSmall(label),
        const SizedBox(height: 10),
        SizedBox(
          child: CupertinoTheme(
            data: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'Jura', fontSize: 8),
              ),
            ),
            child: CupertinoSlidingSegmentedControl<T>(
              children: options,
              groupValue: selection,
              onValueChanged: (T val) {
                setFunc(val);
              },
              thumbColor: const Color(0x881FC52D),
              backgroundColor: const Color(0xFF0E635E),
            ),
          ),
          width: double.infinity,
        )
      ],
    );
  }
}
