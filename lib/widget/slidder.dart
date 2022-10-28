import 'package:flutter/material.dart';
import 'package:reel_folio/Saved/widget/saved_item_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: non_constant_identifier_names
Widget SliderListItem(BuildContext context, Widget function){
  return Container(
    height: screenHeight!*0.1,
    child: Slidable(
    // Specify a key if the Slidable is dismissible.
    key: const ValueKey(0),

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
      ],
    ),

    // The child of the Slidable is what the user sees when the
    // component is not dragged.
    child: ListTile(title: function),
),
  );
}