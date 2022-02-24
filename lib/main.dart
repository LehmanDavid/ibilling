import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/bloc/date_bloc.dart';
import 'package:ibilling/bloc/new_contract/bloc/new_contract_bloc.dart';
import 'package:ibilling/bloc/new_invoice/bloc/new_invoice_bloc.dart';
import 'package:ibilling/models/invoice_model.dart';
import 'package:ibilling/repositories/contract_repository.dart';
import 'package:ibilling/ui/home_page.dart';
import 'cubit/nextweek/nextweek_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = ContractRepositoryImpl();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => DateBloc(repository)
              ..add(
                ContractLoad(activeDay: DateTime.now()),
              ),
          ),
          BlocProvider(create: (_) => NextweekCubit()),
          BlocProvider(create: (context) => NewContractBloc(repository)),
          BlocProvider(
            create: (context) => NewInvoiceBloc()
              ..add(
                 LoadNewInvoice(invoices: [
                  Invoice(
                    servicename: "servicename", 
                    amount: "amount", 
                    status: "status", 
                    date: "date", 
                    num: "num")
                ]),
              ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}
