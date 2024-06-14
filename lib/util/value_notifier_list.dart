import 'package:flutter/cupertino.dart';

class ValueNotifierList<T> extends ValueNotifier<List<T>> {
  ValueNotifierList(List<T> value) : super(value);

  void add(T item) {
    value.add(item);
    notifyListeners();
  }

  void addAll(List<T> items) {
    value.addAll(items);
    notifyListeners();
  }

  void remove(T item) {
    value.remove(item);
    notifyListeners();
  }

  void removeAt(int index) {
    value.removeAt(index);
    notifyListeners();
  }

  void clear() {
    value = [];
    notifyListeners();
  }

  void updateAt(int index, T item) {
    value[index] = item;
    notifyListeners();
  }

  void updateItem(T oldItem, T newItem) {
    final index = value.indexOf(oldItem);
    if (index != -1) {
      updateAt(index, newItem);
    }
  }

  void updateAll(List<T> items) {
    value = items;
    notifyListeners();
  }

  void notify() {
    super.notifyListeners();
  }
}