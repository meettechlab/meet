import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meet/models/message_model.dart';
import 'package:meet/widgets/item_widget.dart';
import 'package:meet/widgets/show_snackbar.dart';

import '../slidable_action.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Message> demo = List.of(chats);
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
              padding: EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                  ),
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
              (context, index) => Slidable(
                child: ItemWidget(item: demo[index]),
                /*key: Key("$demo[index]"),
                dismissal: SlidableDismissal(
                  child: SlidableDrawerDismissal(),
                  onDismissed: (type) {
                    final action = type == SlideActionType.primary
                        ? SlidableAction.delete
                        : SlidableAction.reply;

                    onDismissed(index, action);
                  },
                ),*/
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.15,
                actions: <Widget>[
                  IconSlideAction(
                    icon: Icons.delete,
                    foregroundColor: Colors.red,
                    color: Color(0x1A000000),
                    onTap: () => onDismissed(index, SlidableAction.delete),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    icon: Icons.reply,
                    foregroundColor: Colors.green,
                    color: Color(0x1A000000),
                    onTap: () => onDismissed(index, SlidableAction.reply),
                  ),
                ],
              ),
              // Builds 1000 ListTiles
              childCount: demo.length,
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF6200EE),
          onPressed: () {}),
    );
  }

  void onDismissed(int index, SlidableAction action) {
    final chat = chats[index];

    //setState(() => chats.removeAt(index) );

    switch (action) {
      case SlidableAction.delete:
        _showMyDialog(index);
        break;
      case SlidableAction.reply:

        //_showMyDialog(index);
        //Navigator.of(context).pop();
        break;
    }
  }

  Future<void> _showMyDialog(int message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Delete this conversion',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you like to remove this whole conversation?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CONFIRM',
                  style: TextStyle(
                    color: Colors.red,
                  )),
              onPressed: () {
                setState(() => chats.removeAt(message));
                Navigator.of(context).pop();
                ShowSnackbar.buildErrorSnackbar(context,"Deleted successfully!");
               /* final snackBar = SnackBar(
                    behavior: SnackBarBehavior.fixed,
                    duration: Duration(seconds: 1),
                    backgroundColor: Color(0xFFEEEDED),
                    content: Text('The whole conversion is deleted',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        )));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
              },
            ),
            TextButton(
              child: const Text('CANCEL',
                  style: TextStyle(
                    color: Colors.green,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
