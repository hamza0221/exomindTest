import 'package:exomind_test/utils/app_colors.dart';
import 'package:exomind_test/utils/infos_messages.dart';
import 'package:exomind_test/utils/project_assets.dart';
import 'package:exomind_test/utils/project_style.dart';
import 'package:exomind_test/utils/size_config.dart';
import 'package:exomind_test/view/widgets/header_item.dart';
import 'package:flutter/material.dart';

abstract class IStartViewModel extends ChangeNotifier {
  void displayWeatherScreen(bool val);
}

class StartScreen extends StatefulWidget {
  final IStartViewModel _viewModel;

  const StartScreen(this._viewModel, {Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: widget._viewModel,
            builder: (context, child) {
              return Column(
                children: [
                  HeaderItem(
                      imagePath: ProjectAssets.imgHomeWeather,
                      text: weatherStatText),
                  pageContent(context)
                ],
              );
            }),
      ),
    );
  }

  Widget pageContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
        child: InkWell(
          child: Container(
            height: getProportionateScreenHeight(45),
            width: getProportionateScreenWidth(150),
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                )),
            child: Center(
              child: Text(seeWeatherText,
                  textAlign: TextAlign.center, style: ProjectStyle.textHome),
            ),
          ),
          onTap: () {
            widget._viewModel.displayWeatherScreen(true);
          },
        ));
    // );
  }
}
