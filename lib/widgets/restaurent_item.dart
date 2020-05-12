
import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/mobx/restaurent.dart';
import 'package:first_app/model/dish_item_response.dart';
import 'package:first_app/model/menu_item_response.dart';
import 'package:first_app/model/restaurent_item_response.dart';
import 'package:first_app/widgets/dish_type_indicator.dart';
import 'package:first_app/widgets/quantity_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DishDetails extends StatefulWidget {
  RestaurentItem restaurent;
  RestaurentStore restaurentStore;

  DishDetails(this.restaurent, this.restaurentStore);
  @override
  State<StatefulWidget> createState() {
    return _DishDetailsState();
  }
}

class _DishDetailsState extends State<DishDetails>
    with TickerProviderStateMixin {
  List<Tab> _tabs = List<Tab>();
  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _tabController = TabController(
        length: widget.restaurent.tableMenuList.length, vsync: this);
    super.initState();
  }

  Widget _buildSingleItem(DishItem dishItem) {
    return ListTile(
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5, 0.0),
        trailing: Container(
          height: 250,
          width: 60,
          child: CachedNetworkImage(
            imageUrl: dishItem.dishImage,
            fit: BoxFit.cover,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FoodTypeIndicator(
              foodType: dishItem.dishType,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dishItem.dishName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            dishItem.dishCurrency +
                                " " +
                                dishItem.dishPrice.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          dishItem.dishCalories.toString() + " calories",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    dishItem.dishDescription,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  QuantitySpinner(
                    selectedQuantity: widget.restaurentStore.getQuantity(dishItem.dishId),
                    onQuantityAdd: () {
                      widget.restaurentStore.addToCart(dishItem);
                    },
                    onQuantityRemove: () {
                      widget.restaurentStore.removeFromCart(dishItem);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  dishItem.addOnCat
                      ? Text(
                          "Customizations Available",
                          style: TextStyle(color: Colors.red[200]),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        )
        // trailing: SpriseQuantitySpinner(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            isScrollable: true,
            tabs: buildTabs(widget.restaurent.tableMenuList),
            controller: _tabController,
          ),
          backgroundColor: Colors.white,
          title: Observer(
              builder: (context) => Text(
                    widget.restaurent.restaurentName,
                    style: TextStyle(color: Colors.black),
                  )),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            Stack(children: <Widget>[
              IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 11,
                left: 22,
                child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Observer(
                        builder: (context) => Text(
                            widget.restaurentStore.cartItemCounter.toString(),
                            style: TextStyle(color: Colors.white,fontSize: 10)))),
              )
            ])
          ],
        ),
        body: Observer(
          builder: (context) => TabBarView(
            controller: _tabController,
            children: buildTabViewList(widget.restaurent.tableMenuList),
          ),
        ));
  }

  List<Tab> buildTabs(List<MenuItem> tableMenuList) {
    _tabs.clear();
    int count = tableMenuList.length != 0 ? tableMenuList.length : 6;
    for (int i = 0; i < count; i++) {
      _tabs.add(getTab(tableMenuList[i].menuCategory));
    }
    return _tabs;
  }

  Tab getTab(String tabName) {
    return Tab(
      text: tabName,
    );
  }

  List<CustomScrollView> buildTabViewList(List<MenuItem> tableMenuList) {
    List<CustomScrollView> tabViewList = [];

    tableMenuList
        .forEach((item) => tabViewList.add(CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return buildDishList(item.menuCategoryDishes);
                }, childCount: 1),
              )
            ])));
    return tabViewList;
  }

  Widget buildDishList(List<DishItem> dishes) {
    List<Widget> dishList = [];
    dishes.forEach((item) => dishList.add(_buildSingleItem(item)));
    return Column(
      children: dishList,
    );
  }
}

