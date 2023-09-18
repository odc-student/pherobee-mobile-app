import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../shared_widgets/app_bar_widget.dart';
import '../shared_widgets/navbar.dart';

class BeehiveScreen extends StatelessWidget {
  const BeehiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];
    List<_SalesData> data2 = [
      _SalesData('Jan', 25),
      _SalesData('Feb', 18),
      _SalesData('Mar', 4),
      _SalesData('Apr', 22),
      _SalesData('May', 10)
    ];
    return Scaffold(
      bottomNavigationBar: const Navbar(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.1),
          child: const SafeArea(
              child: AppBarWidget(
            title: "Beehive Num",
            // location: 'Location',
          ))),
      body: SafeArea(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Hour"),
              Text("Day"),
              Text("Week"),
              Text("Month"),
            ],
          ),
          //Initialize the chart widget
          SizedBox(
            height: context.height * 0.25,
            width: context.width,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Temperature'),
                // Enable legend
                legend: const Legend(
                    isVisible: true, position: LegendPosition.bottom),
                // Enable tooltip
                // tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  AreaSeries(
                    color: AppColors.secondaryColor.withOpacity(0.4),
                    dataSource: data,
                    xValueMapper: (datum, index) => datum.year,
                    yValueMapper: (datum, index) => datum.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                  AreaSeries(
                    color: AppColors.secondaryColor,
                    dataSource: data2,
                    xValueMapper: (datum, index) => datum.year,
                    yValueMapper: (datum, index) => datum.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ]),
          ),
          SizedBox(
            height: context.height * 0.2,
            width: context.width,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Humidity'),
                // Enable legend
                // Enable tooltip
                // tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  AreaSeries(
                    color: AppColors.secondaryColor,
                    dataSource: data,
                    xValueMapper: (datum, index) => datum.year,
                    yValueMapper: (datum, index) => datum.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ]),
          ),
          SizedBox(
            height: context.height * 0.2,
            width: context.width,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Weight'),
                // Enable legend
                // legend: const Legend(
                //     isVisible: true, position: LegendPosition.bottom),
                // Enable tooltip
                // tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  AreaSeries(
                    color: AppColors.secondaryColor,
                    dataSource: data2,
                    xValueMapper: (datum, index) => datum.year,
                    yValueMapper: (datum, index) => datum.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ]),
          ),

          //
          // SizedBox(
          //   height: context.height * 0.2,
          //   width: context.width * 0.9,
          //   child: SfSparkAreaChart(
          //     borderColor: AppColors.primaryColor,
          //     borderWidth: 5,
          //     data: const [15, 20, 30, 45, 40],
          //     color: AppColors.thirdColor,
          //     labelDisplayMode: SparkChartLabelDisplayMode.all,
          //     trackball: const SparkChartTrackball(
          //         activationMode: SparkChartActivationMode.tap),
          //   ),
          // ),

          Container(
              width: context.width * 0.5,
              padding: EdgeInsets.fromLTRB(context.medium,context.small,context.medium,context.small),
              decoration: const BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius:BorderRadius.all( Radius.circular(10)),
              ),
              child: Text(
                "See all records",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: context.medium,color: AppColors.orangeColor),
              )),
        ]),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
