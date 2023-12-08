import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    runApp(const MyApp());
  });
}
// def -  hyperbole -  eg, def - jargon - eg, def - irony - eg, def - sarcasm - eg
// def - colloquialism - eg, def - puns - eg, def - taboo language - eg


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
          surface: const Color(0xff003909),
          //rgb(188, 139, 195)
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Go to Counter Page'),
            onPressed: () {
              Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) => Container(),
          ),
       );
        },
      ),
   ),
      ),
    );
  }
}

