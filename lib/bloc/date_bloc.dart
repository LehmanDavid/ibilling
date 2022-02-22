import 'package:bloc/bloc.dart';
import 'package:ibilling/models/user_model.dart';
import 'package:ibilling/repositories/contract_repository.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  final ContractRepository repository;

  DateBloc(this.repository)
      : super(DateState(activeDay: DateTime.now(), paymentList: const [])) {
    on<ContractLoad>((event, emit) async {
      final contract = await repository.getContracts();
      final sorted =
          genrateSortedContract(event.activeDay.toString(), contract);
      emit(DateState(paymentList: sorted, activeDay: event.activeDay));
    });
  }

  List<UserModel> genrateSortedContract(
      String activeDay, List<UserModel> contract) {
    final List<UserModel> sortedContractData = [];
    for (var i = 0; i < contract.length; i++) {
      if (contract[i].date == Jiffy(activeDay).format('dd.MM.yyyy')) {
        sortedContractData.add(contract[i]);
      }
    }
    return sortedContractData;
  }
}