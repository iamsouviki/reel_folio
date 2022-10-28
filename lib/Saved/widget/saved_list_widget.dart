import 'package:flutter/material.dart';
import 'package:reel_folio/Saved/widget/saved_item_widget.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget SavedList(BuildContext context){
  return Container(
    height: screenHeight!*0.1,
    child: Slidable(
    // Specify a key if the Slidable is dismissible.
    key: const ValueKey(0),

    // The start action pane is the one at the left or the top side.
    // startActionPane: ActionPane(
    //   // A motion is a widget used to control how the pane animates.
    //   motion: const ScrollMotion(),

    //   // A pane can dismiss the Slidable.
    //   dismissible: DismissiblePane(onDismissed: () {}),

    //   // All actions are defined in the children parameter.
    //   children: [
    //     // A SlidableAction can have an icon and/or a label.
    //     SlidableAction(
    //       onPressed: (context){},
    //       backgroundColor: Color(0xFFFE4A49),
    //       foregroundColor: Colors.white,
    //       icon: Icons.delete,
    //       label: 'Delete',
    //     ),
    //     SlidableAction(
    //       onPressed: (context){},
    //       backgroundColor: Color(0xFF21B7CA),
    //       foregroundColor: Colors.white,
    //       icon: Icons.share,
    //       label: 'Share',
    //     ),
    //   ],
    // ),

    // The end action pane is the one at the right or the bottom side.
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          // An action can be bigger than the others.
          flex: 2,
          onPressed: (context){},
          backgroundColor: deletebuttoncolor,
          foregroundColor: Colors.white,
          // icon: Icons.archive,
          label: 'Delete',
        ),
        // SlidableAction(
        //   onPressed: (context){},
        //   backgroundColor: Color(0xFF0392CF),
        //   foregroundColor: Colors.white,
        //   icon: Icons.save,
        //   label: 'Save',
        // ),
      ],
    ),

    // The child of the Slidable is what the user sees when the
    // component is not dragged.
    child: ListTile(title: SavedItem()),
),
  );
}