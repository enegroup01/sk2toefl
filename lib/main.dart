import 'package:flutter/material.dart';
import 'package:sk2toefl/utility/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sk2 Toefl',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> courseMenu = ['寫作考古題', '2022~2023最新題目', '精選文章範例'];
  List<String> artTopics = [
    "Impressionism",
    "Surrealism",
    "Abstract art",
    "Renaissance",
    "Modern art"
  ];
  List<String> technologyTopics = [
    "Artificial intelligence",
    "Blockchain",
    "Internet of Things (IoT)",
    "Cloud computing",
    "Cybersecurity"
  ];

  List<String> newsTopics = [
    "Politics",
    "Business",
    "Sports",
    "Health",
    "Weather"
  ];
  List<String> entertainmentTopics = [
    "Movies",
    "Music",
    "TV shows",
    "Gaming",
    "Celebrities"
  ];
  bool _isButton1Expanded = false;
  bool _isButton2Expanded = false;
  bool _isButton3Expanded = false;
  bool _isButton4Expanded = false;

  void _toggleButton1Expanded() {
    setState(() {
      _isButton1Expanded = !_isButton1Expanded;
    });
  }

  void _toggleButton2Expanded() {
    setState(() {
      _isButton2Expanded = !_isButton2Expanded;
    });
  }

  void _toggleButton3Expanded() {
    setState(() {
      _isButton3Expanded = !_isButton3Expanded;
    });
  }

  void _toggleButton4Expanded() {
    setState(() {
      _isButton4Expanded = !_isButton4Expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 400,
        leading: Row(
          children: [
            MenuButton(courseMenu: courseMenu),
            SizedBox(
              width: 20,
            ),
            searchbar(),
          ],
        ),
        backgroundColor: kDarkBlueColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/images/sk2.jpeg',
              width: 50,
            ),
            SizedBox(
              width: 20,
            ),
            const Text('SK2 TOEFL Writing Gizmo'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                )),
          )
        ],
      ),
      backgroundColor: kLightGreyColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey.shade100),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: sideBarDrawer()),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey.shade100),
                    color: Colors.white),
                padding: EdgeInsets.all(20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Drawer sideBarDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              '文章類別',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bookmarks_outlined),
            title: Text("Art & LifeStyle"),
            onTap: _toggleButton1Expanded,
          ),
          _isButton1Expanded
              ? Column(
                  children: artTopics
                      .map((storyTitle) => ListTile(
                            title: TextButton(
                              style: ButtonStyle(alignment: Alignment.topLeft),
                              onPressed: () {},
                              child: Text(
                                storyTitle,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ))
                      .toList(),
                )
              : SizedBox(),
          ListTile(
            leading: Icon(Icons.bookmarks_outlined),
            title: Text("Technology"),
            onTap: _toggleButton2Expanded,
          ),
          _isButton2Expanded
              ? Column(
                  children: technologyTopics
                      .map((storyTitle) => ListTile(
                            title: TextButton(
                              style: ButtonStyle(alignment: Alignment.topLeft),
                              onPressed: () {},
                              child: Text(
                                storyTitle,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ))
                      .toList(),
                )
              : SizedBox(),
          ListTile(
            leading: Icon(Icons.bookmarks_outlined),
            title: Text("News"),
            onTap: _toggleButton3Expanded,
          ),
          _isButton3Expanded
              ? Column(
                  children: newsTopics
                      .map((storyTitle) => ListTile(
                            title: TextButton(
                              style: ButtonStyle(alignment: Alignment.topLeft),
                              onPressed: () {},
                              child: Text(
                                storyTitle,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ))
                      .toList(),
                )
              : SizedBox(),
          ListTile(
            title: Text(
              'AI 導師',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          ListTile(
            leading: Icon(Icons.playlist_add_outlined),
            title: Text('自動撰寫文章'),
            onTap: _toggleButton4Expanded,
          ),
          _isButton4Expanded
              ? Container(
                  height: 500,
                  child: FilterViewSidebar(),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class FilterViewSidebar extends StatefulWidget {
  @override
  _FilterViewSidebarState createState() => _FilterViewSidebarState();
}

class _FilterViewSidebarState extends State<FilterViewSidebar> {
  bool _checkBox1Value = false;
  bool _checkBox2Value = false;
  bool _checkBox3Value = false;
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();
  TextEditingController _textField3Controller = TextEditingController();

  @override
  void dispose() {
    _textField1Controller.dispose();
    _textField2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            "自訂內容",
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _textField1Controller,
            decoration: InputDecoration(
              labelText: "文章標題",
            ),
          ),
          CheckboxListTile(
            title: Text("Emphasize Higher-Level Thinking"),
            value: _checkBox1Value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _checkBox1Value = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Narrative writing style"),
            value: _checkBox2Value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _checkBox2Value = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Descriptive writing style"),
            value: _checkBox3Value,
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _checkBox3Value = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _textField2Controller,
            decoration: InputDecoration(
              labelText: "字數 ex. 250",
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _textField3Controller,
            decoration: InputDecoration(
              labelText: "希望加入的字彙 ex. perseverance, ambition",
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle filter button tap
              print("Filter Button tapped");
            },
            child: Text("開始撰寫"),
          ),
        ],
      ),
    );
  }
}

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white10,
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () {
              // Clear the search text
            },
          ),
        ),
        onChanged: (value) {
          // Handle the search text change
        },
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.courseMenu,
  });

  final List<String> courseMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            const Text(
              'Course',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      itemBuilder: (BuildContext context) {
        return courseMenu.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice,
              style: TextStyle(color: Colors.blue),
            ),
          );
        }).toList();
      },
      onSelected: (String choice) {
        // Handle selected option here
      },
    );
  }
}

class course_dropdownButton extends StatelessWidget {
  const course_dropdownButton({
    super.key,
    required this.courseMenu,
  });

  final List<String> courseMenu;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: courseMenu.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: courseMenu.first,
      onChanged: (value) => null,
    );
  }
}
