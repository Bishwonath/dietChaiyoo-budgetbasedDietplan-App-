// import 'package:diet_chaiyoo/view/Sigup_View.dart';
// import 'package:diet_chaiyoo/view/User_Agesetup_View.dart';
// import 'package:flutter/material.dart';

// class BudgetSetup extends StatefulWidget {
//   const BudgetSetup({super.key});

//   @override
//   State<BudgetSetup> createState() => _BudgetSetupState();
// }

// class _BudgetSetupState extends State<BudgetSetup> {
//   bool first = false, second = false, third = false, randombutton = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SignUpView()),
//                 );
//               },
//               child: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 size: 30.0,
//                 color: Theme.of(context).iconTheme.color,
//               ),
//             ),
//             const SizedBox(height: 30.0),
//             Text(
//               "Choose Your Goal",
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const SizedBox(height: 20.0),
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildImageCard(
//                     imageUrl: 'assets/images/Rs. 500.png',
//                     isSelected: first,
//                     onTap: () {
//                       setState(() {
//                         first = true;
//                         second = false;
//                         third = false;
//                         randombutton = true;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   _buildImageCard(
//                     imageUrl: 'assets/images/Rs. 700.png',
//                     isSelected: second,
//                     onTap: () {
//                       setState(() {
//                         first = false;
//                         second = true;
//                         third = false;
//                         randombutton = true;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   _buildImageCard(
//                     imageUrl: 'assets/images/Rs.1000.png',
//                     isSelected: third,
//                     onTap: () {
//                       setState(() {
//                         first = false;
//                         second = false;
//                         third = true;
//                         randombutton = true;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: randombutton
//                   ? () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const UserAgeSetup()),
//                       );
//                     }
//                   : null,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: randombutton
//                       ? Theme.of(context).colorScheme.primary
//                       : Theme.of(context).colorScheme.surface,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Next",
//                     style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                           color: randombutton
//                               ? Theme.of(context).colorScheme.onPrimary
//                               : Theme.of(context).colorScheme.onSurface,
//                         ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildImageCard({
//     required String imageUrl,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height / 6,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected
//                 ? Theme.of(context).colorScheme.primary
//                 : Colors.transparent,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Image.asset(
//             imageUrl,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }
