import 'package:flutter/material.dart';
import 'package:holiday/widgets/bottomnav.dart';
import 'package:holiday/widgets/floatingCenterButton.dart';

void main() {
  runApp(const MyApp());
}

const seed = Color(0xFF6750A4);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6750A4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  onPrimaryContainer: Color(0xFF21005D),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  onSecondaryContainer: Color(0xFF1D192B),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  error: Color(0xFFB3261E),
  errorContainer: Color(0xFFF9DEDC),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410E0B),
  background: Color(0xFFFFFBFE),
  onBackground: Color(0xFF1C1B1F),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  outline: Color(0xFF79747E),
  onInverseSurface: Color(0xFFF4EFF4),
  inverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFFD0BCFF),
  shadow: Color(0xFF000000),
);
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  error: Color(0xFFF2B8B5),
  errorContainer: Color(0xFF8C1D18),
  onError: Color(0xFF601410),
  onErrorContainer: Color(0xFFF9DEDC),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  outline: Color(0xFF938F99),
  onInverseSurface: Color(0xFF1C1B1F),
  inverseSurface: Color(0xFFE6E1E5),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final TextStyle textStyle = const TextStyle(
    fontSize: 20,
  );
  final searchIcon = const Icon(
    Icons.search,
  );
  final clear = const Icon(
    Icons.clear,
  );
  final microphone = const Icon(
    Icons.mic,
  );
  final back = const Icon(
    Icons.arrow_back,
  );
  final labelStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    letterSpacing: 0.7,
  );

  final TabBarView tabBarView = TabBarView(
    children: [
      ListView.separated(
        itemBuilder: (context, index) => Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.arrow_drop_down_circle),
                title: Text("Card $index"),
                subtitle: Text(
                  'Secondary Text',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('ACTION 1'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('ACTION 2'),
                  ),
                ],
              ),
              Image.network(
                  'https://www.viaggi-usa.it/wp-content/uploads/2013/01/copertina.jpg'),
            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 100,
      ),
      const Center(
        child: Icon(Icons.restaurant_menu),
      ),
      const Center(
        child: Icon(Icons.directions_car),
      ),
      const Center(
        child: Icon(Icons.local_gas_station),
      ),
      const Center(
        child: Icon(Icons.hotel),
      ),
    ],
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
    'fardvark',
    'gobcat',
    'ehameleon',
    'tardvark',
    'ttobcat',
    'rhameleon',
    'bardvark',
    'nobcat',
    'emhameleon',
  ];
  String _searchText = "";

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 5,
      child: Builder(
        builder: (context) {
          TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            setState(() {
              _tabIndex = tabController.index;
            });
            print('index: $_tabIndex');
          });
          return Scaffold(
            body: NestedScrollView(
              floatHeaderSlivers: true,
              body: widget.tabBarView,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    bottom: TabBar(
                      // indicatorWeight: 0.0001,
                      indicatorWeight: 20,
                      indicator:
                          CircleTabIndicator(color: Colors.red, radius: 0),
                      controller: tabController,
                      labelStyle: widget.labelStyle,
                      tabs: [
                        Tab(
                          child: Container(
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(20),
                            //   color: _tabIndex == 0
                            //       ? Theme.of(context).primaryColorDark
                            //       : Theme.of(context)
                            //           .appBarTheme
                            //           .backgroundColor,
                            // ),
                            padding: const EdgeInsets.fromLTRB(12, 5, 15, 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.flight,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Flight",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.hotel,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Hotel",
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.restaurant_menu,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Food",
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.directions_bike,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Auto",
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.local_gas_station,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Station",
                              ),
                            ],
                          ),
                        ),
                      ],
                      isScrollable: true,
                    ),
                    title: Autocomplete(
                      fieldViewBuilder: (context, textEditingController,
                          focusNode, onFieldSubmitted) {
                        textEditingController.addListener(() {
                          setState(() {
                            _searchText = textEditingController.text;
                          });
                        });
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          style: widget.textStyle,
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.surfaceVariant,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            prefixIcon: _searchText.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      textEditingController.clear();
                                      _unFocusSearch();
                                    },
                                    icon: widget.back,
                                  )
                                : widget.searchIcon,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: const Radius.circular(20),
                                  bottom: Radius.circular(
                                      _searchText.isNotEmpty ? 0 : 20)),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: const Radius.circular(20),
                                  bottom: Radius.circular(
                                      _searchText.isNotEmpty ? 0 : 20)),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            ),
                            suffixIcon: _searchText.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      textEditingController.clear();
                                      _unFocusSearch();
                                    },
                                    icon: widget.clear,
                                  )
                                : IconButton(
                                    onPressed: _speck,
                                    icon: widget.microphone,
                                  ),
                            hintText: "Search...",
                            hintStyle: widget.textStyle,
                          ),
                        );
                      },
                      displayStringForOption: (String option) => option,
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(25)),
                                // color: Theme.of(context).colorScheme.primary,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                              // height: 50.2 * options.length,
                              // width: 380,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () =>
                                      onSelected(options.elementAt(index)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 15),
                                    child: Text(
                                      options.elementAt(index),
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return _kOptions.where((String option) {
                          return option
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        debugPrint('You just selected $selection');
                        _unFocusSearch();
                      },
                    ),
                    floating: true,
                    pinned: true,
                  ),
                ];
              },
            ),
            bottomNavigationBar: const BottomNavigation(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const FloatingCenterButton(),
          );
        },
      ),
    );
  }

  void _speck() {}

  void _unFocusSearch() {
    FocusScope.of(context).unfocus();
  }

  void _updateTab(value) {
    setState(() {
      _tabIndex = value;
    });
    print('index: $_tabIndex');
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(500 / 2, 500 - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
