import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gov_service_app/home_screen/model/service_model.dart';

class HomeProvider with ChangeNotifier {
  bool isConnected = false;
  var connected = Connectivity();
  List<GovServiceModel> allOptions = [
    GovServiceModel(
        title: 'Home',
        webUril: 'https://uidai.gov.in/en/',
        icons: Icons.home_rounded),
    GovServiceModel(
        title: 'Update Aadhaar',
        webUril: 'https://uidai.gov.in/en/my-aadhaar/update-aadhaar.html',
        icons: Icons.touch_app_rounded),
    GovServiceModel(
        title: 'Get Aadhaar',
        webUril: 'https://uidai.gov.in/en/my-aadhaar/get-aadhaar.html',
        icons: Icons.get_app_rounded),
    GovServiceModel(
        title: 'Aadhaar Service',
        webUril:
            'https://uidai.gov.in/en/my-aadhaar/avail-aadhaar-services.html',
        icons: Icons.miscellaneous_services_rounded),
  ];

  //One Time check Connectivity
  void checkNetwork() async {
    List<ConnectivityResult> result = await connected.checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      isConnected = false;
    } else {
      isConnected = true;
    }
    notifyListeners();
  }

  //Immediately Check Connectivity all time
  void checkConnectivityAllTime() async {
    connected.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          isConnected = false;
        } else {
          isConnected = true;
        }
        notifyListeners();
      },
    );
  }
}
