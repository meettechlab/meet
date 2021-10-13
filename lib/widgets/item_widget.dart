import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet/models/message_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meet/widgets/show_snackbar.dart';

import '../slidable_action.dart';

class ItemWidget extends StatefulWidget {
  final Message item;

  const ItemWidget({ Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
          child: ListTile(
            onTap: (){
              final slidable = Slidable.of(context)!;
              final isClosed = slidable.renderingMode == SlidableRenderingMode.none;
              if(isClosed){
                slidable.open();
              }else{
                slidable.close();
              }
            },
              onLongPress: () async{
                final number = await showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: createDialog,
                );

                switch (number){
                  case 1:
                    print('reply');
                    break;
                  case 2:
                    print('ignor');
                    break;
                  case 3:
                    print('mark');
                    break;
                  case 4:
                    //setState(() =>  );
                    ShowSnackbar.buildErrorSnackbar(context,"Deleted successfully!");
                    //print('delete');

                    break;
                }
              },
            leading: Image.asset(widget.item.sender.imageUrl),
            title: Text(widget.item.sender.name),
            subtitle: Text(widget.item.text),
            trailing: Text(widget.item.time)
          ),
      ),
    );
  }

  Widget createDialog(BuildContext context) => CupertinoAlertDialog(
    actions: [
      CupertinoDialogAction(
        child: Text("Reply",
        style: TextStyle(
          color: Color(0xBA303030),
        ),
        ),
        onPressed: () => Navigator.pop(context,1),
      ),
      CupertinoDialogAction(
        child: Text("Ignore",
          style: TextStyle(
            color: Color(0xBA303030),
          ),
        ),
        onPressed: () => Navigator.pop(context,2),
      ),
      CupertinoDialogAction(
        child: Text("Mark as seen",
          style: TextStyle(
            color: Color(0xBA303030),
          ),
        ),
        onPressed: () => Navigator.pop(context,3),
      ),
      CupertinoDialogAction(
        child: Text("Remove",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        onPressed: () => Navigator.pop(context,4),
      ),
    ],
  );
}
