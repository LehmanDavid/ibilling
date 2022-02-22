import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/cubit/main_page/main_page_cubit.dart';
import 'package:ibilling/themes/colors.dart';
import 'package:ibilling/themes/theme.dart';
import 'package:ibilling/ui/create/new_contract.dart';
import 'package:ibilling/ui/create/new_invoice.dart';
import 'package:provider/src/provider.dart';

class ChooseType extends StatelessWidget {
  const ChooseType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 190,
        width: 327,
        color: BillingColor.darkColor,
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'What do you want to create?',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 287,
              height: 46,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF4E4E4E))),
                onPressed: () async {
                  // Pages.pages[2] = const NewContract();
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (constext) => const NewContract()));
                  Navigator.pop(context);
                  context.read<MainPageCubit>().changeIndex(0);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/contract.svg'),
                    const SizedBox(width: 16),
                    Text('Contract', style: BillingThemes.textTheme.bodyText1)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 287,
              height: 46,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF4E4E4E))),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (constext) => NewInvoice()));
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/invoice.svg'),
                    const SizedBox(width: 16),
                    Text('Invoice', style: BillingThemes.textTheme.bodyText1)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
