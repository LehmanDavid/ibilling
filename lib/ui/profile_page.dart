// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ibilling/themes/colors.dart';
// import 'package:ibilling/themes/theme.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//   enum Language { uzb, rus, eng }

// class _ProfilePageState extends State<ProfilePage> {
// late Language _language;
// var lang = {
//     'English (USA)': SvgPicture.asset('assets/icons/en.svg'),
//     'Русский': SvgPicture.asset('assets/icons/ru.svg'),
//     'O\'zbek (Lotin)': SvgPicture.asset('assets/icons/uz.svg'),
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: BillingColor.darkWorld,
//         elevation: 0,
//         title: Row(
//           children: [
//             Container(
//               height: 24,
//               width: 24,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/gradient.png'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             const SizedBox(width: 12),
//             const Text(
//               "Profile",
//               style: TextStyle(fontSize: 18.0, fontFamily: "Ubuntu"),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: BillingColor.darkWorld,
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 16, top: 10, right: 16),
//               color: BillingColor.darkColor,
//               height: 170,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 15),
//                   Row(
//                     children: [
//                       const SizedBox(width: 20),
//                       SvgPicture.asset('assets/icons/profile_card.svg'),
//                       const SizedBox(width: 16),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             'Otabek Abdusamatov',
//                             style: TextStyle(
//                               color: BillingColor.lightGreenColor,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Graphic designer • IQ Education',
//                             style: TextStyle(
//                               color: Color(0xffE7E7E7),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 22),
//                   Row(
//                     children: [
//                       const SizedBox(width: 20),
//                       const Text(
//                         'Date of birth:',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Ubuntu',
//                             fontSize: 14),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         '16.09.2001',
//                         style: BillingThemes.textTheme.bodyText2,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       const SizedBox(width: 20),
//                       const Text(
//                         'Phone number: ',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Ubuntu',
//                             fontSize: 14),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         '+998 97 721 06 88',
//                         style: BillingThemes.textTheme.bodyText2,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       const SizedBox(width: 20),
//                       const Text(
//                         'E-mail: ',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Ubuntu',
//                             fontSize: 14),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         'predatorhunter041@gmail.com',
//                         style: BillingThemes.textTheme.bodyText2,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             // Container(
//             //   height: 44,
//             //   margin: const EdgeInsets.only(left: 16, top: 15, right: 16),
//             //   color: BillingColor.darkColor,
//             // ),
//               const SizedBox(height: 10),
//             GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) => AlertDialog(
//                     title: Text(
//                       'choose_language',
//                       style: BillingThemes.textTheme.headline5,
//                       textAlign: TextAlign.center,
//                     ),
//                     content: StatefulBuilder(
//                       builder:(context,StateSetter setState)=> Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           RadioListTile<dynamic>(
//                             value: Language.uzb,
//                             groupValue: _language,
//                             toggleable: true,
//                             onChanged: (value) {
//                               setState(()=>_language=value);
//                             },
//                             title: Text(
//                               'O\'zbek (Lotin)',
//                               style: BillingThemes.textTheme.headline6,
//                             ),
//                             secondary: SvgPicture.asset('assets/icons/uz.svg'),
//                             controlAffinity: ListTileControlAffinity.trailing,
//                           ),
//                           RadioListTile<dynamic>(
//                             value: Language.rus,
//                             groupValue: _language,
//                             toggleable: true,
//                             onChanged: (value) {
//                               setState(()=>_language=value);
//                             },
//                             title: Text(
//                               'Русский',
//                               style: BillingThemes.textTheme.headline6,
//                             ),
//                             secondary: SvgPicture.asset('assets/icons/ru.svg'),
//                             controlAffinity: ListTileControlAffinity.trailing,
//                           ),
//                           RadioListTile<dynamic>(
//                             value: Language.eng,
//                             groupValue: _language,
//                             toggleable: true,
//                             onChanged: (value) {
//                               setState(()=>_language=value);
//                             },
//                             title: Text(
//                               'English (USA)',
//                               style: BillingThemes.textTheme.headline6,
//                             ),
//                             secondary: SvgPicture.asset('assets/icons/en.svg'),
//                             controlAffinity: ListTileControlAffinity.trailing,
//                           ),
//                           const SizedBox(height: 10),
//                         ],
//                       ),
//                     ),
//                     actions: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           MaterialButton(
//                             onPressed: () {
//                               //context.setLocale(initialLang);
//                               setState(() {});
//                               Navigator.of(context).pop();
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.25,
//                               padding: const EdgeInsets.all(9),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7),
//                                 color: BillingColor.darkGreenColor,
//                               ),
//                               child: Text(
//                                 'cancel',
//                                 style: BillingThemes.textTheme.headline6
//                                     ?.copyWith(color: const Color(0xff11dbee)),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                           MaterialButton(
//                             onPressed: () {
//                               context.setLocale(Locale(_language == Language.rus
//                                   ? 'ru'
//                                   : _language == Language.uzb
//                                       ? 'uz'
//                                       : 'en'));
//                               Navigator.of(context).pop();
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.25,
//                               padding: const EdgeInsets.all(9),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7),
//                                 color: BillingColor.lightGreenColor,
//                               ),
//                               child: Text(
//                                 'done',
//                                 style: BillingThemes.textTheme.headline6
//                                     ?.copyWith(color: Colors.white),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.only(left: 13),
//                 width: 20,      ////////
//                 height: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   color: BillingColor.darkColor,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'language',
//                       style: BillingThemes.textTheme.headline6,
//                     ),
//                     lang['language'],
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
