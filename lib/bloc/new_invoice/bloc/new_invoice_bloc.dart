import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibilling/models/invoice_model.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, NewInvoiceState> {
  //List<Invoice> invoicelist = [];
  NewInvoiceBloc() : super(NewInvoiceLoading()) {
    on<LoadNewInvoice>(_onLoadNewInvoice);
    on<CreateNewInvoice>(_onCreateNewInvoice);
    on<UpdateNewInvoice>(_onUpdateNewInvoice);
  }
  void _onLoadNewInvoice(event, emit) {
    //emit(NewInvoiceLoaded(invoices: event.invoices));   //WTF
  }

  void _onCreateNewInvoice(CreateNewInvoice event, emit) {
    final state = this.state;
    if (state is NewInvoiceLoaded) {
      emit(NewInvoiceLoaded(
          invoices: List.from(state.invoices)..add(event.invoice)));
    }
  }

  void _onUpdateNewInvoice(event, emit) {}
}
