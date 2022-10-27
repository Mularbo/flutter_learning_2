import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorlist = const <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          PieChart(
            dataMap: const {
              "Total": 20,
              "Recoverd": 15,
              "Deaths": 5,
            },
            animationDuration: const Duration(milliseconds: 1200),
            chartType: ChartType.ring,
            colorList: colorlist,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            legendOptions:
                const LegendOptions(legendPosition: LegendPosition.left),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .06),
            child: Card(
              child: Column(children: [
                ReusableRow(title: "total", value: "200"),
                ReusableRow(title: "total", value: "200"),
                ReusableRow(title: "total", value: "200"),
              ]),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xff1aa260),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text("Track Countries"),
            ),
          )
        ],
      ),
    )));
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
