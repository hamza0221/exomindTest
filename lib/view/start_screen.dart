import 'package:exomind_test/utils/project_style.dart';
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
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: widget._viewModel,
            builder: (context, child) {
              return Column(
                children: [myHeader(context), pageContent(context)],
              );
            }),
      ),
    );
  }

  Widget myHeader(BuildContext context) {
    return Container();
  }

  Widget pageContent(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(children: [
          Text(
            "Welcome to Weather Statitics",
            style: ProjectStyle.bookTitle,
          ),
          const SizedBox(height: 20),
          InkWell(
            child: Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  )),
              child: const Center(
                child: Text(
                  'See Weather!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xFF006F27)),
                ),
              ),
            ),
            onTap: () {
              widget._viewModel.displayWeatherScreen(true);
            },
          ),
        ]));
  }
}
