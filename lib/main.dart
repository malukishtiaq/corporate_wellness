// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerRow(),
                  const SizedBox(
                    height: 12,
                  ),
                  progressCards(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(45, 43, 75, 1),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
              bottom: Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(size: 40, color: Colors.white, Icons.home),
              Icon(size: 40, color: Colors.white, Icons.notifications),
              Icon(size: 40, color: Colors.white, Icons.video_camera_back),
              Icon(size: 40, color: Colors.white, Icons.message),
              Icon(size: 40, color: Colors.white, Icons.person)
            ],
          ),
        ),
      ),
    );
  }

  final PageController pageController = PageController(viewportFraction: 2.8);
  Widget progressCardsDiscard() {
    return Column(
      children: [
        Text(
          'Your progress',
          style: TextStyle(
            color: blackColor(),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        PageView.builder(
          controller: pageController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                double value = 1.0;
                if (pageController.position.haveDimensions) {
                  value = pageController.page! - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.85, 1.0);
                }

                return SizedBox(
                  height: Curves.easeOut.transform(value) * 200,
                  width: Curves.easeOut.transform(value) * 350,
                  child: child,
                );
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(229, 116, 104, 1),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget progrsessCards() {
    return Column(
      children: [
        Text(
          'Your progress',
          style: TextStyle(
            color: blackColor(),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        yourCardWidget(Color.fromRGBO(229, 116, 104, 1),
            Color.fromRGBO(162, 129, 58, 1), Colors.white),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget progressCards() {
    double circleAvatarVal = 20;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your progress',
          style: TextStyle(
            color: const Color.fromRGBO(45, 42, 74, 1),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: yourCardWidget(
                Color.fromRGBO(229, 116, 104, 1),
                Color.fromRGBO(253, 253, 253, 1),
                Color.fromRGBO(253, 253, 253, 1),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: yourCardWidget(
                Color.fromRGBO(248, 214, 119, 1),
                Color.fromRGBO(162, 129, 58, 1),
                Color.fromRGBO(129, 96, 39, 1),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wednesday, March 7',
              style: TextStyle(
                color: blackColor(),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 224, 229, 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Icon(
                Icons.calendar_month,
                size: 35,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        newMethod(circleAvatarVal),
        SizedBox(
          height: 10,
        ),
        newMethod(circleAvatarVal),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Row newMethod(double circleAvatarVal) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Color.fromRGBO(253, 253, 254, 1),
          child: Text(
            '10:00 AM',
            style: TextStyle(
              color: blackColor(),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(250, 227, 232, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meeting with frontend developers',
                  style: TextStyle(
                    color: blackColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Flose Real State Project',
                  style: TextStyle(
                    color: blackColor(),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: circleAvatarVal,
                            child: Text(
                              'I',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Positioned(
                            left: circleAvatarVal,
                            child: Center(
                              child: CircleAvatar(
                                radius: circleAvatarVal,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  'A',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: circleAvatarVal * 2,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                                radius: circleAvatarVal,
                                child: Text(
                                  'S',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: circleAvatarVal * 3,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: circleAvatarVal,
                                child: Text(
                                  'Z',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: circleAvatarVal * 4,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: circleAvatarVal,
                                child: Text(
                                  'N',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('10:00 AM - 11:50 PM'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Stack multiUserStack() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        // First avatar
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 100 / 2,
          child: Icon(Icons.person, color: Colors.blue),
        ),
        // Second avatar
        Positioned(
          left: 100 - 50,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 100 / 2,
            child: Icon(Icons.person, color: Colors.green),
          ),
        ),
        // Third avatar
        Positioned(
          left: 2 * (100 - 50),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 100 / 2,
            child: Icon(Icons.person, color: Colors.yellow),
          ),
        ),
      ],
    );
  }

  Row currentDateCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Wednesday, March 7',
          style: TextStyle(
            color: blackColor(),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(224, 224, 229, 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Icon(
            Icons.calendar_month,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget yourCardWidget(Color color, Color progressColor, Color textColor) {
    return AspectRatio(
      aspectRatio: 170 / 250,
      child: Card(
        elevation: 10,
        shadowColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 25),
              Stack(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      value: 0.45,
                      color: progressColor,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 10,
                    child: Text(
                      '19/40',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Working\nHours',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Working hours\nexceeded by 3 hours',
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Color blackColor() => const Color.fromRGBO(45, 42, 74, 1);

  Row headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello, Villie!',
          style: TextStyle(
            color: blackColor(),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/user_image.jpeg'),
        )
      ],
    );
  }
}
