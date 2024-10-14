# government_service_app

## Description
I used the connectivity_plus package to monitor the user's network status and determine if they are online or offline. This package allowed me to check the type of connection (Wi-Fi, mobile data, or none) and listen for real-time connectivity changes. Based on this, I was able to show appropriate messages or handle data fetching only when an active internet connection was available. This ensures a smoother user experience by managing network-dependent features effectively.

## Exapmle Code
```bash
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
```

<img src="https://github.com/user-attachments/assets/92526010-98b1-4963-a07e-4a74634559a2" height=65% width=22%>
<img src="https://github.com/user-attachments/assets/6c4aaa05-03b4-421a-849e-818501077880" height=65% width=22%>


https://github.com/user-attachments/assets/c27ac847-6754-429e-90bc-9420d004ed96

## Burger Hub App
<img src="https://github.com/user-attachments/assets/ab13d21a-cf7c-4186-8d8c-a84cc1b2a323" height=65% width=22%>
<img src="https://github.com/user-attachments/assets/ccd26042-e672-4072-897c-9fff88c9247f" height=65% width=22%>



## Search Engine
<img src="https://github.com/user-attachments/assets/35077547-8ccd-416a-9cdb-ce3191e6b564" height=65% width=22%>

https://github.com/user-attachments/assets/c0130002-fa64-403b-aa22-112403a20dae

