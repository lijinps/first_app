// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurent.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurentStore on _RestaurentStore, Store {
  Computed<RestaurentItem> _$restaurentComputed;

  @override
  RestaurentItem get restaurent => (_$restaurentComputed ??=
          Computed<RestaurentItem>(() => super.restaurent))
      .value;

  final _$cartItemCounterAtom = Atom(name: '_RestaurentStore.cartItemCounter');

  @override
  int get cartItemCounter {
    _$cartItemCounterAtom.context.enforceReadPolicy(_$cartItemCounterAtom);
    _$cartItemCounterAtom.reportObserved();
    return super.cartItemCounter;
  }

  @override
  set cartItemCounter(int value) {
    _$cartItemCounterAtom.context.conditionallyRunInAction(() {
      super.cartItemCounter = value;
      _$cartItemCounterAtom.reportChanged();
    }, _$cartItemCounterAtom, name: '${_$cartItemCounterAtom.name}_set');
  }

  final _$_restaurentsAtom = Atom(name: '_RestaurentStore._restaurents');

  @override
  RestaurentListResponse get _restaurents {
    _$_restaurentsAtom.context.enforceReadPolicy(_$_restaurentsAtom);
    _$_restaurentsAtom.reportObserved();
    return super._restaurents;
  }

  @override
  set _restaurents(RestaurentListResponse value) {
    _$_restaurentsAtom.context.conditionallyRunInAction(() {
      super._restaurents = value;
      _$_restaurentsAtom.reportChanged();
    }, _$_restaurentsAtom, name: '${_$_restaurentsAtom.name}_set');
  }

  final _$getRestaurentsAsyncAction = AsyncAction('getRestaurents');

  @override
  Future<void> getRestaurents() {
    return _$getRestaurentsAsyncAction.run(() => super.getRestaurents());
  }

  final _$_RestaurentStoreActionController =
      ActionController(name: '_RestaurentStore');

  @override
  void addToCart() {
    final _$actionInfo = _$_RestaurentStoreActionController.startAction();
    try {
      return super.addToCart();
    } finally {
      _$_RestaurentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart() {
    final _$actionInfo = _$_RestaurentStoreActionController.startAction();
    try {
      return super.removeFromCart();
    } finally {
      _$_RestaurentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cartItemCounter: ${cartItemCounter.toString()},restaurent: ${restaurent.toString()}';
    return '{$string}';
  }
}
