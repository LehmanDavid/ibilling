import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/bloc/new_invoice/bloc/new_invoice_bloc.dart';
import 'package:ibilling/themes/colors.dart';

class ContractButtons extends StatefulWidget {
  const ContractButtons({Key? key}) : super(key: key);

  @override
  State<ContractButtons> createState() => _ContractButtonsState();
}

class _ContractButtonsState extends State<ContractButtons> {
  bool _isContract = true;

  bool _isInvoice = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewInvoiceBloc, NewInvoiceState>(
      builder: (context, state) {
        return Row(
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
                context.read<NewInvoiceBloc>().add(const LoadNewInvoice());
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
        );
      },
    );
  }
}
