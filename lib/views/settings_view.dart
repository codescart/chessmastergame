import 'package:chessmastergame/model/app_model.dart';
import 'package:chessmastergame/views/components/settings_view/piece_theme_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'components/settings_view/app_theme_picker.dart';
import 'components/settings_view/toggles.dart';
import 'components/shared/bottom_padding.dart';
import 'components/shared/text_variable.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  InterstitialAd interstitialAd;

  @override
  Widget build(BuildContext context) {
    InterstitialAd.load(
        // ignore: deprecated_member_use
        adUnitId: InterstitialAd.testAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
    return Consumer<AppModel>(
      builder: (context, appModel, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: appModel.theme.background),
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              const TextLarge('Settings'),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const AppThemePicker(),
                    const SizedBox(height: 10),
                    Toggles(appModel),
                    const SizedBox(height: 10),
                    const PieceThemePicker(),
                  ],
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Image.asset("assets/images/back.png"),
                  //Text("Start")
                ),
                onTap: () {
                  Navigator.pop(context);
                  interstitialAd.show();
                },
              ),
              const BottomPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
