import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class OnlineOfflineScreen extends StatelessWidget {
  const OnlineOfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/img/online.jpg'),
                ),
                const Text(
                  'Welcome back! Now your internet is working perfectly',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else if (snapshot.data!.contains(ConnectivityResult.vpn)) {
            return const Center(
              child: Text("It seems you're connected to VPN"),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/img/offline.png'),
                  ),
                  const Text(
                    "It seems you're offline",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Check your internet connection",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
