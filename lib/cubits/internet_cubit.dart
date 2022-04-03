import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  StreamSubscription? internetStreamSubscription;

  InternetCubit(this.connectivity) : super(InternetInitial()) {
    monitorInternet();
  }

  StreamSubscription<ConnectivityResult> monitorInternet() {
    return internetStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        emit(InternetConnectedMobile(
            message: 'Thank God! Connected to Mobile Network'));
      } else if (event == ConnectivityResult.wifi) {
        emit(InternetConnectedWifi(message: 'Yay! Wifi Connected'));
      } else if (event == ConnectivityResult.none) {
        emit(InternetDisconnected(message: 'Oops! No Internet Connection'));
      }
    });
  }

  Future<void> cancel() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
