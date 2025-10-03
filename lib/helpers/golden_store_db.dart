import 'package:hive/hive.dart';

class GoldenStoreDb {
  List<dynamic> likedProductList = [];
  final myBox = Hive.box('myBox');
  
  // Craete Initail methode for the first time using the app
  createinitialData() {
    likedProductList = [];
  }
  // load the data from the database
  loadData() {
    likedProductList = myBox.get(("ToDoList"));
  }
  // ubdatedataBase
  ubdatedataBase() {
        myBox.put("ToDoList",likedProductList);
  }
}