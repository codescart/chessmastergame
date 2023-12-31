import 'dart:async';

import 'package:chessmastergame/model/app_model.dart';
import 'package:chessmastergame/views/components/chess_view/chess_board_widget.dart';
import 'package:chessmastergame/views/components/chess_view/game_info_and_controls.dart';
import 'package:chessmastergame/views/components/chess_view/promotion_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/chess_view/game_info_and_controls/game_status.dart';
import 'components/shared/bottom_padding.dart';

class ChessView extends StatefulWidget {
  final AppModel appModel;

  const ChessView(this.appModel, {Key key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ChessViewState createState() => _ChessViewState(appModel);
}

class _ChessViewState extends State<ChessView> {
  AppModel appModel;

  _ChessViewState(this.appModel);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) {
        if (appModel.promotionRequested) {
          appModel.promotionRequested = false;
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _showPromotionDialog(appModel));
        }
        return WillPopScope(
          onWillPop: _willPopCallback,
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(gradient: appModel.theme.background),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Spacer(),
                  ChessBoardWidget(appModel),
                  const SizedBox(height: 30),
                  const GameStatus(),
                  const Spacer(),
                  GameInfoAndControls(appModel),
                  const BottomPadding(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPromotionDialog(AppModel appModel) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return PromotionDialog(appModel);
      },
    );
  }

  Future<bool> _willPopCallback() async {
    if (appModel != null) {
      appModel.exitChessView();
    }
    return true;
  }
}
