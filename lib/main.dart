import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColorLight: const Color(0xff6200EE),
        primaryColorDark: const Color(0xff6200EE),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            // backgroundColor: Color(0xff80007f),
            ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xff6200EE),
          elevation: 20,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff6200EE),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        )
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("widget.title"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu,color: Colors.white,)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications,color: Colors.white,)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person,color: Colors.white,)),
          ],
        ),
        // child: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        //     BottomNavigationBarItem(tooltip: "",icon: Icon(Icons.home),label: "aa"),
        //   ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
