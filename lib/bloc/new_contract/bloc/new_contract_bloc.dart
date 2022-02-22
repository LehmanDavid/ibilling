import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibilling/models/user_model.dart';
import 'package:ibilling/repositories/contract_repository.dart';

part 'new_contract_event.dart';
part 'new_contract_state.dart';

class NewContractBloc extends Bloc<NewContractEvent, NewContractState> {
  final ContractRepository repository;

  NewContractBloc(this.repository) : super(NewContractLoading()) {
    on<LoadNewContract>(_onLoadNewContract);
    on<CreateNewContract>(_onCreateNewContract);
    on<UpdateNewContract>(_onUpdateNewContract);
  }
  void _onLoadNewContract(event, emit) {
    emit(NewContractLoaded(usermodels: event.usermodels));
  }

  void _onCreateNewContract(event, emit) {}
  void _onUpdateNewContract(event, emit) {}
}
