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
        emit(InternetConnected());
      } else if (event == ConnectivityResult.wifi) {
        emit(InternetConnected());
      } else if (event == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }
    });
  }

  Future<void> cancel() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
