import 'package:flutter/material.dart';

class QuantitySpinner extends StatefulWidget {
  final int selectedQuantity;
  final int maxQuantity;
  final int minQuantity;
  final Function onQuantityAdd;
  final Function onQuantityRemove;

  QuantitySpinner(
      {this.selectedQuantity = 0,
      this.maxQuantity = 50,
      this.minQuantity = 0,
      this.onQuantityAdd,
      this.onQuantityRemove});

  @override
  State<StatefulWidget> createState() {
    return _QuantitySpinnerState();
  }
}

class _QuantitySpinnerState extends State<QuantitySpinner> {
  int _selectedQuantity;
  _QuantitySpinnerState();
  @override
  void initState() {
    _selectedQuantity = widget.selectedQuantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(0),
      height: 35,
      width: 125,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color: Colors.green,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
              onPressed: _selectedQuantity == widget.minQuantity
                  ? null
                  : () {
                      setState(() {
                        _selectedQuantity -= 1;
                        widget.onQuantityRemove();
                      });
                    },
            ),
          ),
          Text(
            '$_selectedQuantity',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: IconButton(
              alignment: Alignment.topRight,
              icon: Icon(Icons.add, color: Colors.white, size: 20),
              onPressed: _selectedQuantity == widget.maxQuantity
                  ? null
                  : () {
                      setState(() {
                        _selectedQuantity += 1;
                        widget.onQuantityAdd();
                      });
                    },
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
