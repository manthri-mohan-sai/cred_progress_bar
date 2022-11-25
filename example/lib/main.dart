import 'package:cred_progress_bar/cred_progress_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cred Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cred Slider Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  late ScrollController _scrollController1;

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController1.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController1 = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kToolbarHeight),
            // Regular list view with cred progress bar
            SizedBox(
              height: 256,
              child: ListView.builder(
                physics:
                    const BouncingScrollPhysics(), // add this to get fluid animation
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 256,
                    height: 256,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  CredProgressBar(
                    controller: _scrollController,
                    barWidth: 120,
                    thumbWidth: 12,
                    barHeight: 14,
                    barColor: Colors.amber,
                    thumbColor: Colors.purple.shade300,
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'over 3 lakh members win vochuers daily',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
            ),
            /// Bigger cred progress bar for showcase
            const SizedBox(height: kToolbarHeight),
            SizedBox(
              height: 256,
              child: ListView.builder(
                physics:
                    const BouncingScrollPhysics(), // add this to get fluid animation
                scrollDirection: Axis.horizontal,
                controller: _scrollController1,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 256,
                    height: 256,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: CredProgressBar(
                controller: _scrollController1,
                barWidth: 300,
                thumbWidth: 18,
                barHeight: 20,
                barColor: Colors.amber,
                thumbColor: Colors.purple.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
