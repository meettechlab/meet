import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet/models/message_model.dart';
import 'package:meet/widgets/item_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5000, (index) => chats[0]);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Add the app bar to the CustomScrollView.
          const SliverAppBar(

            // Provide a standard title.
            title: Text("Message"),
            titleSpacing: 30.0,
            actions: <Widget>[
              CircleAvatar(),
              Padding(padding: EdgeInsets.only(right: 20.0)),
            ],
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            pinned: true,
            stretch: true,

            // Display a placeholder widget to visualize the shrinking size.
            //flexibleSpace: Placeholder(),
            // Make the initial height of the SliverAppBar larger than normal.
            collapsedHeight: 160,
            expandedHeight: 160,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 120.0,left: 20.0, right: 20.0),
              child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search,),
                      fillColor: Color(0x13303030),
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Color(0x13303030),
                       ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x13303030),
                        ),
                      ),
                      hintText: 'Find your friends?',
                    ),
                  ),
            ),
          ),

          // Next, create a SliverList
           SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                    (context, index) => ItemWidget(item: dummyList[index]),
                // Builds 1000 ListTiles
                childCount: dummyList.length,
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF6200EE),
        unselectedItemColor: Color(0xBA303030),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            title: Text(""),
            icon: Icon(CupertinoIcons.bubble_left_bubble_right_fill),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Icon(Icons.wc_outlined),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Icon(Icons.assignment_ind_sharp),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
        floatingActionButton:
    FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF6200EE),
        onPressed: () {}
        ),
    );

  }
}
