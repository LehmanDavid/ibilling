import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/bloc/date_bloc.dart';
import 'package:ibilling/bloc/new_invoice/bloc/new_invoice_bloc.dart';
import 'package:ibilling/themes/colors.dart';
import 'package:ibilling/widgets/app_bar.dart';
import 'package:ibilling/widgets/contract_buttons.dart';
import 'package:ibilling/widgets/contract_card.dart';
import 'package:ibilling/widgets/custom%20calendar/calendar.dart';
import 'package:ibilling/widgets/invoice_card.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  bool _isContract = true;

  bool _isInvoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar1(
            title: 'Contracts',
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: BillingColor.darkWorld,
          child: Column(
            children: [
              Container(
                height: 147,
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
                  //const ContractButtons(),               //////////////////
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _isContract = true;
                            _isInvoice = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: _isContract
                                ? BillingColor.lightGreenColor
                                : BillingColor.darkWorld,
                          ),
                          child: const Text(
                            'Contracts',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // context
                          //     .read<NewInvoiceBloc>()
                          //     .add(const LoadNewInvoice());
                          setState(() {
                            _isContract = false;
                            _isInvoice = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: _isInvoice
                                ? BillingColor.lightGreenColor
                                : BillingColor.darkWorld,
                          ),
                          child: const Text(
                            'Invoice',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  // BlocBuilder<DateBloc, DateState>(builder: (event, state) {
                  //   return SizedBox(
                  //     height: 300,
                  //     child: ListView.builder(
                  //       physics: const BouncingScrollPhysics(),
                  //       shrinkWrap: true,
                  //       itemCount: state.paymentList.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return ContractCard(
                  //           userpayment: state.paymentList[index],
                  //         );
                  //       },
                  //     ),
                  //   );
                  // }),
                  BlocBuilder<NewInvoiceBloc, NewInvoiceState>(
                    builder: (context, state) {
                      if (state is NewInvoiceLoaded) {
                        return SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: state.invoices.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InvoiceCard(
                                  invoice: state.invoices[index]);
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
