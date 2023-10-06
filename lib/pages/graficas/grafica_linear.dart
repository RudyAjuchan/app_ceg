import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficaLinear extends StatelessWidget {
GraficaLinear({ Key? key }) : super(key: key);
  final List<Color> gradientColors = [
    const Color(0xff23b6e6).withOpacity(0.3),
    const Color(0xff02d39a).withOpacity(0.3),
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 6:
        text = '6 am';
        break;
      case 7:
        text = '7 am';
        break;
      case 8:
        text = '8 am';
        break;
      case 9:
        text = '9 am';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Lun', style: style);
        break;
      case 1:
        text = const Text('Mar', style: style);
        break;
      case 2:
        text = const Text('Mie', style: style);
        break;
      case 3:
        text = const Text('Jue', style: style);
        break;
      case 4:
        text = const Text('Vie', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }


  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Gráfica por hora de entrada", 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  minX: 0, 
                  maxX: 4,
                  minY:6,
                  maxY:9,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value){
                      return const FlLine(
                        color: Color(0xff37434d),
                        strokeWidth: 0.1,
                      );
                    },
                    drawVerticalLine: false,
                    /* getDrawingVerticalLine: (value){
                      return const FlLine(
                        color: Color(0xff37434d),
                        strokeWidth: 1,
                      );
                    }, */
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: 
                    const Border(bottom: BorderSide(color: Color(0xff37434d), width: 1), left: BorderSide(color: Color(0xff37434d), width: 1)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 6.5),
                        const FlSpot(1, 7),
                        const FlSpot(2, 7.2),
                        const FlSpot(3, 7.3),
                        const FlSpot(4, 7.5),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: gradientColors,
                      ),
                      barWidth: 5,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }  
}