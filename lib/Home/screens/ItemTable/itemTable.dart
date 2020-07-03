// Flutter code sample for AnimatedList

// This sample application uses an [AnimatedList] to create an effect when
// items are removed or added to the list.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:longzongbuy/Home/screens/ItemTable/bloc/itemtable_bloc.dart';
import 'package:longzongbuy/models/shopping_item.dart';

class ItemTable extends StatefulWidget {
  @override
  _ItemTableState createState() => _ItemTableState();
}

class _ItemTableState extends State<ItemTable> {
  Widget _buildGridItem(ShoppingItem item) {
    return Container(child: Text(item.name));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemTableBloc, ItemTableState>(
        builder: (context, state) {
      if (state is ItemTableInitial) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ItemTableError) {
        return Center(
          child: Text("Fail"),
        );
      }
      if (state is ItemTableSuccess) {
        return GridView.count(
            crossAxisCount: 2,
            children: state.items.map(_buildGridItem).toList());
      }
    });
  }
}
