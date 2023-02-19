// import 'package:flutter/material.dart';
// import 'package:home_land/provider/user_provider.dart';
// import 'package:provider/provider.dart';

// class MyOtp extends StatelessWidget {
//   MyOtp({super.key});

//   @override
//   @override
//   Widget build(BuildContext context) {
//     final userProvider = context.read<UserProvider>();
//     print(userProvider.userDataModel.first.Name);
//     return Scaffold(
//       body: SafeArea(
//         child: Consumer<UserProvider>(
//           builder: (context, value, child) {
//             if (value.userDataModel.isNotEmpty == true) {
//               print(value.userDataModel.first.Name);
//               return Text(value.userDataModel.first.Name ?? 'No user photo');
//             } else {
//               return Text('User data is not available');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
