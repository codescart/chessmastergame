import 'package:chessmastergame/model/app_model.dart';
import 'package:chessmastergame/views/components/main_menu_view/game_options.dart';
import 'package:chessmastergame/views/components/shared/bottom_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'components/main_menu_view/main_menu_buttons.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({Key key}) : super(key: key);

  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  InterstitialAd interstitialAd;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(gradient: appModel.theme.background),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: EdgeInsets.fromLTRB(
                      10, MediaQuery.of(context).padding.top + 10, 10, 0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 20),
                GameOptions(appModel),
                MainMenuButtons(appModel),
                const SizedBox(height: 40),
                const BottomPadding(),
              ],
            ),
          ),
        );
      },
    );
  }
}
