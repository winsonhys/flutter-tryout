import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:Taag/Home/screens/ItemTable/widgets/ItemCard.dart';
import 'package:Taag/graphql/api.graphql.dart';

class ItemTable extends StatefulWidget {
  @override
  _ItemTableState createState() => _ItemTableState();
}

class _ItemTableState extends State<ItemTable> {
  Widget _buildGridItem(ShopItemMixin item) {
    return Itemcard(item: item);
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: WatchQueryOptions(documentNode: AllShopItemsQuery().document),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.loading) {
            return new Text("Loading");
          }
          final List<ShopItemMixin> items =
              AllShopItems$Query.fromJson(result.data).shopItems;
          return Container(
            color: Theme.of(context).accentColor,
            child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.only(top: 20),
                crossAxisCount: 2,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildGridItem(items[index]),
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
          );
        });
  }
}
