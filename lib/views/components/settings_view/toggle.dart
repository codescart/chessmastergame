import 'package:flutter/cupertino.dart';

import '../shared/text_variable.dart';

class Toggle extends StatelessWidget {
  final String label;
  final bool toggle;
  final Function setFunc;

  const Toggle(this.label, {Key key, this.toggle, this.setFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          TextRegular(label),
          const Spacer(),
          CupertinoSwitch(
            value: toggle,
            onChanged: setFunc,
          ),
        ],
      ),
    );
  }
}
