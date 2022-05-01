import 'package:flutter/material.dart';
import 'package:holiday/constants.dart';
import 'package:holiday/widgets/bottomnav.dart';
import 'package:holiday/widgets/floatingCenterButton.dart';

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
    fontSize: 12,
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
                            fillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
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
                    bottom: PreferredSize(
                      preferredSize: Size(double.maxFinite,53),
                      child: Column(
                        children: [
                          TabBar(
                            indicator: BoxDecoration(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30),
                            ),

                            indicatorSize: TabBarIndicatorSize.tab,
                            controller: tabController,
                            labelStyle: widget.labelStyle,
                            tabs: [
                              Tab(
                                // height: 10,

                                child: Row(
                                  children: [
                                    Icon(Icons.flight,size: 15),
                                    Text("Flight",style: TextStyle(fontSize: 15),),
                                  ],
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
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
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

}