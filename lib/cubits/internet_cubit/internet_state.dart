part of 'internet_cubit.dart';

 class InternetState {}

class InternetInitial extends InternetState {
 
}

class InternetConnectedWifi extends InternetState {
    String message; 
  InternetConnectedWifi({
    required this.message,
  });
}

class InternetConnectedMobile extends InternetState {
    String message; 
  InternetConnectedMobile({
    required this.message,
  });
}

class InternetDisconnected extends InternetState {

  
  String message; 
   InternetDisconnected({
    required this.message,
  });


}
