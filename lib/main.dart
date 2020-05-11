import 'package:first_app/mobx/restaurent.dart';
import 'package:first_app/widgets/restaurent_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RestaurentStore>(
        create: (BuildContext context) => RestaurentStore(),
        // child: Consumer(builder: null) MaterialApp(title: 'Test', home: MyWidget()),
        child: Consumer<RestaurentStore>(
          builder: (context, value, _) => MyWidget(value),
        ));
  }
}

class MyWidget extends StatefulWidget {
  RestaurentStore restaurentStore;
  MyWidget(this.restaurentStore);

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  getData() async {
    await widget.restaurentStore.getRestaurents();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Observer(
            builder: (context) =>
                widget.restaurentStore.restaurent.restaurentId == "0"
                    ? Scaffold(
                        body: SpinKitThreeBounce(
                          color: Colors.red,
                          size: 18,
                        ),
                      )
                    : DishDetails(widget.restaurentStore.restaurent,
                        widget.restaurentStore)));
  }
}
