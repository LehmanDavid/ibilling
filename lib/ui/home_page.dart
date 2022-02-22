import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/bloc/date_bloc.dart';
import 'package:ibilling/cubit/main_page/main_page_cubit.dart';
import 'package:ibilling/themes/colors.dart';
import 'package:ibilling/ui/contract_page.dart';
import 'package:ibilling/ui/history_page.dart';
import 'package:ibilling/ui/profile_page.dart';
import 'package:ibilling/ui/saved_page.dart';
import 'package:ibilling/widgets/choose_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({Key? key}) : super(key: key);

  final _widgetOptions = const [
    ContractPage(),
    HistoryPage(),
    ChooseType(),
    SavedPage(),
    ProfilePage()
  ];

  void _onItemTapped(BuildContext context, int index) async {
    if (index == 2) {
      await showDialog(
        context: context,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: const ChooseType(),
          );
        },
      );
    } else {
      context.read<MainPageCubit>().changeIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _widgetOptions.elementAt(state),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: BillingColor.darkWorld,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            onTap: (index) => _onItemTapped(context, index),
            currentIndex: state,
            showUnselectedLabels: true,
            unselectedItemColor: BillingColor.greyColor,
            items: [
              BottomNavigationBarItem(
                label: 'Contracts',
                icon: state == 0
                    ? SvgPicture.asset('assets/icons/Bookmark1.svg')
                    : SvgPicture.asset('assets/icons/Bookmark2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'History',
                icon: state == 1
                    ? SvgPicture.asset('assets/icons/clock1.svg')
                    : SvgPicture.asset('assets/icons/clock2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'New',
                icon: state == 2
                    ? SvgPicture.asset('assets/icons/Plus1.svg')
                    : SvgPicture.asset('assets/icons/Plus2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'Saved',
                icon: state == 3
                    ? SvgPicture.asset('assets/icons/Bookmark1.svg')
                    : SvgPicture.asset('assets/icons/Bookmark2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: state == 4
                    ? SvgPicture.asset('assets/icons/Profile1.svg')
                    : SvgPicture.asset('assets/icons/Profile2.svg'),
              ),
            ],
          ),
        );
      },
    );
  }
}
