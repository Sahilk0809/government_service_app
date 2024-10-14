import 'package:flutter/material.dart';
import 'package:government_service_app/modal/burger_modal.dart';
import 'package:government_service_app/utils/list.dart';

class BurgerProvider extends ChangeNotifier {
  List<BurgerModal> burgerList = [];

  void makeListOfObject() {
    for (int i = 0; i < webList.length; i++) {
      BurgerModal burgerModal = BurgerModal.fromMap(webList[i]);
      burgerList.add(burgerModal);
    }
  }

  BurgerProvider(){
    makeListOfObject();
  }
}
