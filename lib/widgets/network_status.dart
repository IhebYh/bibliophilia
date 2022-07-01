import 'package:bibliophilia/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkStatus extends StatelessWidget {
  final Widget child;
  final Widget offlineChild;
  NetworkStatus({
    required this.child,
    required this.offlineChild,
  });

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Offline) {
      return offlineChild;
    } else {
      return child;
    }
  }
}