import 'package:flutter/material.dart';
import 'package:healthandwellness/res/colors/app_color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final String text;
  const Chart({Key? key, required this.text}) : super(key: key);

  @override
  ChartState createState() => ChartState();
}

class ChartState extends State<Chart> {
  late List<ChartData> data;
  late List<_Color> color;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      ChartData('Missed', 65, Colors.blue),
      ChartData('Upcoming', 32, Colors.orange),
      ChartData('Completed', 90, Colors.green),
    ];
    color = [_Color(Colors.red), _Color(Colors.red), _Color(Colors.green)];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.cChartBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: SfCartesianChart(
        title: ChartTitle(
          text: widget.text,
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Montserrat',
          ),
        ),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 25),
        tooltipBehavior: _tooltip,
        series: <CartesianSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Text("${data.y}%");
              },
            ),
            name: 'Progress',
            pointColorMapper: (ChartData data, _) => data.color,
            sortingOrder: SortingOrder.ascending,
            sortFieldValueMapper: (ChartData data, _) => data.x,
          ),
        ],
      ),
    );
  }
}

class _Color {
  final Color z;

  _Color(this.z);
}

class ChartData {
  final String x;
  final double y;
  final Color? color;

  ChartData(
    this.x,
    this.y,
    this.color,
  );
}
