import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({required Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scrollcontroller = ScrollController();
  bool showListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_rounded,
          shadows: [Shadow(color: Colors.black)],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.green,
                          ),
                          Text("Search fresh groceries"),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.format_list_bulleted_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  "All Categories",
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    scrollcontroller.animateTo(787,
                        duration: const Duration(seconds: 3),
                        curve: Curves.easeInOut);
                    setState(() {
                      showListView = !showListView;
                    });
                  },
                  icon: const Icon(Icons.grid_view_rounded),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: showListView ? _buildListView() : _buildGridView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildItem();
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return _buildItem();
      },
    );
  }

  Widget _buildItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/kivi.png'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Kivi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
