import 'package:chessmastergame/model/app_model.dart';
import 'package:flutter/cupertino.dart';

class RestartExitButtons extends StatelessWidget {
  final AppModel appModel;

  const RestartExitButtons(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Image.asset("assets/images/restart.png"),
            onTap: () {
              appModel.newGame(context);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            child: Image.asset("assets/images/exit.png"),
            onTap: () {
              appModel.exitChessView();
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
