import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa268),
    const Color(0xffde5426),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            PieChart(
              dataMap: const {
                "Total": 20,
                "Recovered": 15,
                "Deaths": 5,
              },
              colorList: colorList,
              chartType: ChartType.ring,
              animationDuration: const Duration(milliseconds: 1200),
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions:
                  const LegendOptions(legendPosition: LegendPosition.left),
            )
          ],
        ),
      ),
    );
  }
}
