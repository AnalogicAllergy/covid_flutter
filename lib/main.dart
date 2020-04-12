import 'package:covid19/Country.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'MenuEntry.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(title: 'Covid-19'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
      ],
      isCurved: true,
      colors: [
        const Color(0xffFF1af1),
      ],
      barWidth: 1,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
//
//    final LineChartBarData lineChartBarData3 = LineChartBarData(
//      spots: [
//        FlSpot(1, 2.8),
//        FlSpot(3, 1.9),
//        FlSpot(6, 3),
//        FlSpot(10, 1.3),
//        FlSpot(13, 2.5),
//      ],
//      isCurved: true,
//      colors: const [
//        Color(0xff27b6fc),
//      ],
//      barWidth: 8,
//      isStrokeCapRound: true,
//      dotData: FlDotData(
//        show: false,
//      ),
//      belowBarData: BarAreaData(
//        show: false,
//      ),
//    );
    return [
      lineChartBarData1,
//      lineChartBarData2,
//      lineChartBarData3,
    ];
  }

  List<LineChartBarData> linesBarData2() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: const [
        Color(0xff7151c1),
      ],
      barWidth: 1,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData2,
//      lineChartBarData3,
    ];
  }

  List<MenuItem> menus = [
    new MenuItem("Active Cases", true),
    new MenuItem("Dead", false),
    new MenuItem("Recovered", false),
    new MenuItem("Recovered", false),
    new MenuItem("Being analised", false)
  ];

  List<Country> countries = [
    new Country("USA", "assets/usa.png", 104256),
    new Country("Italy", "assets/italy.png", 86498),
    new Country("Brazil", "assets/brazil.jpg", 20984)
  ];
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HeaderCovid(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //graph 1
                  GraphOne(),
                  //graphs 2 and 3
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.red.withOpacity(0.2)
                                    ])),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Affected",
                                      style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "598.3k",
                                      style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: LineChart(LineChartData(
                                      gridData: FlGridData(
                                        show: true,
                                        drawVerticalLine: true,
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff37434d),
                                            strokeWidth: 1,
                                          );
                                        },
                                        getDrawingVerticalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff37434d),
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 22,
                                          textStyle: const TextStyle(
                                              color: Color(0xff68737d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8),
                                          getTitles: (value) {
                                            switch (value.toInt()) {
                                              case 2:
                                                return 'JAN';
                                              case 5:
                                                return 'FEB';
                                              case 8:
                                                return 'MAR';
                                            }
                                            return '';
                                          },
                                          margin: 8,
                                        ),
                                        leftTitles: SideTitles(
                                          showTitles: true,
                                          textStyle: const TextStyle(
                                            color: Color(0xff67727d),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                          getTitles: (value) {
                                            switch (value.toInt()) {
                                              case 1:
                                                return '100k';
                                              case 3:
                                                return '300k';
                                              case 5:
                                                return '600k';
                                            }
                                            return '';
                                          },
                                          reservedSize: 28,
                                          margin: 12,
                                        ),
                                      ),
                                      borderData: FlBorderData(
                                          show: true,
                                          border: Border.all(
                                              color: const Color(0xff37434d),
                                              width: 1)),
                                      minX: 0,
                                      maxX: 11,
                                      minY: 0,
                                      maxY: 6,
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots: [
                                            FlSpot(0, 3),
                                            FlSpot(2.6, 2),
                                            FlSpot(4.9, 5),
                                            FlSpot(6.8, 3.1),
                                            FlSpot(8, 4),
                                            FlSpot(9.5, 3),
                                            FlSpot(11, 4),
                                          ],
                                          isCurved: true,
                                          colors: gradientColors,
                                          barWidth: 1,
                                          isStrokeCapRound: true,
                                          dotData: FlDotData(
                                            show: false,
                                          ),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            colors: gradientColors
                                                .map((color) =>
                                                    color.withOpacity(0.3))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ))),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.green.withOpacity(0.2)
                                    ])),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Active",
                                      style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "437.4k",
                                      style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: LineChart(LineChartData(
                                      gridData: FlGridData(
                                        show: true,
                                        drawVerticalLine: true,
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff37434d),
                                            strokeWidth: 1,
                                          );
                                        },
                                        getDrawingVerticalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xff37434d),
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 22,
                                          textStyle: const TextStyle(
                                              color: Color(0xff68737d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8),
                                          getTitles: (value) {
                                            switch (value.toInt()) {
                                              case 2:
                                                return 'JAN';
                                              case 5:
                                                return 'FEB';
                                              case 8:
                                                return 'MAR';
                                            }
                                            return '';
                                          },
                                          margin: 8,
                                        ),
                                        leftTitles: SideTitles(
                                          showTitles: true,
                                          textStyle: const TextStyle(
                                            color: Color(0xff67727d),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                          getTitles: (value) {
                                            switch (value.toInt()) {
                                              case 1:
                                                return '100k';
                                              case 3:
                                                return '300k';
                                              case 5:
                                                return '600k';
                                            }
                                            return '';
                                          },
                                          reservedSize: 28,
                                          margin: 12,
                                        ),
                                      ),
                                      borderData: FlBorderData(
                                          show: true,
                                          border: Border.all(
                                              color: const Color(0xff37434d),
                                              width: 1)),
                                      minX: 0,
                                      maxX: 11,
                                      minY: 0,
                                      maxY: 6,
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots: [
                                            FlSpot(0, 3),
                                            FlSpot(2.6, 2),
                                            FlSpot(4.9, 5),
                                            FlSpot(6.8, 3.1),
                                            FlSpot(8, 4),
                                            FlSpot(9.5, 3),
                                            FlSpot(11, 4),
                                          ],
                                          isCurved: true,
                                          colors: gradientColors,
                                          barWidth: 1,
                                          isStrokeCapRound: true,
                                          dotData: FlDotData(
                                            show: false,
                                          ),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            colors: gradientColors
                                                .map((color) =>
                                                    color.withOpacity(0.3))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ))),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListStatus(menus: menus),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Top Country",
                      style: GoogleFonts.montserrat(
                          color: Color(0xff348a7b),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.montserrat(
                        color: Color(0xff348a7b),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //countries flags
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 20,
                child: ListView.builder(
                    itemCount: countries.length,
                    itemExtent: 200,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CountryCard(countries[index]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CountryCard(Country country) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 200,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff348A7B)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(country.flagUrl),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${country.name}",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${country.countCases}",
                style: GoogleFonts.raleway(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class GraphOne extends StatelessWidget {
  const GraphOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          startAngle: 270,
          angleRange: 360,
          counterClockwise: false,
          customColors: CustomSliderColors(
              progressBarColor: Color(0xff348a7b), trackColor: Colors.white),
          customWidths: CustomSliderWidths(progressBarWidth: 5),
        ),
        min: 0,
        max: 100,
        initialValue: 73,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.green.withOpacity(0.1)),
    );
  }
}

class ListStatus extends StatelessWidget {
  const ListStatus({
    Key key,
    @required this.menus,
  }) : super(key: key);

  final List<MenuItem> menus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 30,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: menus.length,
          itemBuilder: (context, index) {
            return MenuEntry(menus[index]);
          }),
    );
  }
}

Widget MenuEntry(MenuItem value) {
  return Row(
    children: <Widget>[
      Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECF4F3),
        ),
        child: Center(
          child: Text(
            "${value.description}",
            textScaleFactor: 0.75,
            style: GoogleFonts.raleway(
                fontSize: 18,
                color: value.active
                    ? Color(0xff1F6357)
                    : Color(0xff1F6357).withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}

class HeaderCovid extends StatelessWidget {
  const HeaderCovid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: 150,
          child: Row(
            children: <Widget>[
              Container(
                  height: 200,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SvgPicture.asset("assets/mask-woman.svg"),
                  )),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "5 symptoms of",
                    style: GoogleFonts.raleway(
                        color: Color(0xff348a7b),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Covid-19",
                    style: GoogleFonts.raleway(
                        color: Color(0xff348a7b),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Read more",
                    style: GoogleFonts.raleway(
                        color: Color(0xff348a7b),
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20))),
    );
  }
}
