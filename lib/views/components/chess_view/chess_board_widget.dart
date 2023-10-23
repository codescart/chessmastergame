import 'package:chessmastergame/model/app_model.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

class ChessBoardWidget extends StatelessWidget {
  final AppModel appModel;

  const ChessBoardWidget(this.appModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: appModel.theme.name != 'Video Chess'
          ? BoxDecoration(
              border: Border.all(
                color: appModel.theme.border,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 20,
                  color: Color.fromARGB(157, 252, 250, 252),
                ),
              ],
            )
          : const BoxDecoration(),
      child: ClipRRect(
        borderRadius: appModel.theme.name != 'Video Chess'
            ? BorderRadius.circular(5)
            : BorderRadius.zero,
        child: SizedBox(
          child: GameWidget(game: appModel.game),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width - 44,
        ),
      ),
    );
  }
}
