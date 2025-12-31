import 'dart:convert'; //this is used to convert json to dartObj and dartObj to json
import 'dart:io'; //from this we get device needed data like platform
import 'package:device_uuid/device_uuid.dart'; //this device_uuid generates unique token for every device
import 'package:get/get.dart'; //it is for GetXXontroller
import 'package:flutter/foundation.dart';// this is for TargetPltform
import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/constants.dart';
import '../utils/network_call.dart';
class Authentication extends GetxController{
final DeviceUuid deviceid=DeviceUuid(); //uniwue id for each device
String ip_Address='';
var uuid;

late TargetPlatform? platform;//late mean telling dart i will definatley intlize the value later TargePlatform is enum
//enum means it has fixed setof  named values
@override
//this method is availbe in GetXController and  automatically called by getx when we created an object like Get.put(AuthController());
  void onInit(){
    super.onInit();//here first Getx setup then it runs the code
    callIPAdress();
}
void callIPAdress(){
  if(Platform.isAndroid){
    platform=TargetPlatform.android;
  }
  else{
    platform=TargetPlatform.iOS;
  }
  getIPAdress();
}
//why do we need ip address to know the newtork identity like wheather the request comming
// from mobile data,wifi to know from where the account is login like knowing the country
  //backend uses ipaddress to detect suspicous login like that

  //this info will be in info.txt
void getIPAdress() async{
  try{
    var connectivityResult=await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.wifi ||
       connectivityResult == ConnectivityResult.mobile){
    List<NetworkInterface>interfaces=await NetworkInterface.list();//present in dart:io package
      for(var interface in interfaces){
        if(connectivityResult==ConnectivityResult.wifi && (interface.name.contains("wlan")) || (interface.name.contains("wifi"))){
          for(var addr in interface.addresses){
            if (addr.type == InternetAddressType.IPv4) {
              ip_Address = addr.address;
              break;
            }
          }
        }
        else if (connectivityResult == ConnectivityResult.mobile) {
          // Get Mobile Data IP Address
          for (var addr in interface.addresses) {
            if (addr.type == InternetAddressType.IPv4) {
              ip_Address = addr.address;
              break;
            }
          }
        }

        // Stop checking once an IP is found
        if (ip_Address != '') break;
      }
      }
    }
  catch (e) {
    print('Failed to get IP address: $e');
  }
  }
void onLogin(String userId,String pass,context)async{
  callIPAdress();
  uuid=deviceid.getUUID();
  Map<String,dynamic> param={
    "userName":userId,
    "password":pass,
    "device_id":await uuid,
    "api_key":Constants.apiKey,
  };
// call backendAPI
  print("calling server");
  Map<String, dynamic> response =
  await NetworkCall().onCallServer(
    endPoint: "https://server-1-sag5.onrender.com/login",
    parameters: param,
    isPost: true,
  );
  print("hi");
  print(response);

}

}


