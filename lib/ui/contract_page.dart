import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/bloc/date_bloc.dart';
import 'package:ibilling/themes/colors.dart';
import 'package:ibilling/widgets/app_bar.dart';
import 'package:ibilling/widgets/contract_buttons.dart';
import 'package:ibilling/widgets/contract_card.dart';
import 'package:ibilling/widgets/custom%20calendar/calendar.dart';
import 'package:ibilling/widgets/invoice_card.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'Contracts',
        ),
      ),
      body: BlocBuilder<DateBloc, DateState>(
        builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: BillingColor.darkWorld,
            child: Column(
              children: [
                Container(
                  height: 148,
                  decoration: const BoxDecoration(
                    color: BillingColor.darkerColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: BillingColor.darkColor,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: TabCalendar(),
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    const ContractButtons(),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.paymentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ContractCard(
                            userpayment: state.paymentList[index],
                          );
                        },
                      ),
                    ),
                    // SizedBox(
                    //   height: 300,
                    //   child: ListView.builder(
                    //     physics: const BouncingScrollPhysics(),
                    //     itemBuilder: (BuildContext context, int index){
                    //       return InvoiceCard(invoice: state.)
                    //     }),
                    // )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
