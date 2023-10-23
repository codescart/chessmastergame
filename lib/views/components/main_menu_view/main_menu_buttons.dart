import 'package:chessmastergame/model/app_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../chess_view.dart';
import '../../settings_view.dart';

// ignore: must_be_immutable
class MainMenuButtons extends StatelessWidget {
  final AppModel appModel;

  MainMenuButtons(this.appModel, {Key key}) : super(key: key);
  InterstitialAd interstitialAd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,

            child: Image.asset("assets/images/start.png"),
            //Text("Start")
          ),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  appModel.newGame(context, notify: false);
                  return ChessView(appModel);
                },
              ),
            );
            interstitialAd.show();
          },
        ),
        const SizedBox(height: 12),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(3),
            margin: const EdgeInsets.only(top: 8),
            height: MediaQuery.of(context).size.height * 0.085,
            child: Image.asset("assets/images/setting.png"),
            //Text("Start")
          ),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const SettingsView(),
              ),
            );
            interstitialAd.show();
          },
        ),
      ],
    );
  }
}
