import 'package:flutter/cupertino.dart';


class StateModel extends ChangeNotifier{


   Map<String,String> _state = {"title":" ","description":" ","github":"" ,"thumbnail":"https://i.imgur.com/Z22Z6dP.png"};
   
     void set  (Map<String,String> item) {
    _state = item;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

    Map<String,String> get() {
     return _state;
 
    }

}