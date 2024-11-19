// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gov_service_app/utils/helper/shr_helper.dart';

class HomeProvider with ChangeNotifier {
  // bool isConnected = false;
  // var connected = Connectivity();

  bool isTheme = false;
  ThemeMode? mode;

  // //One Time check Connectivity
  // void checkNetwork() async {
  //   List<ConnectivityResult> result = await connected.checkConnectivity();
  //   if (result.contains(ConnectivityResult.none)) {
  //     isConnected = false;
  //   } else {
  //     isConnected = true;
  //   }
  //   notifyListeners();
  // }

  // //Immediately Check Connectivity all time
  // void checkConnectivityAllTime() async {
  //   connected.onConnectivityChanged.listen(
  //     (event) {
  //       if (event.contains(ConnectivityResult.none)) {
  //         isConnected = false;
  //       } else {
  //         isConnected = true;
  //       }
  //       notifyListeners();
  //     },
  //   );
  // }

  void changeTheme() {
    isTheme = !isTheme;
    ShrHelper helps = ShrHelper();

    helps.saveTheme(isTheme);
    notifyListeners();
  }

  void getThemes() async {
    ShrHelper hepls = ShrHelper();

    isTheme = await hepls.getTheme() ?? false;
    notifyListeners();
  }
}
