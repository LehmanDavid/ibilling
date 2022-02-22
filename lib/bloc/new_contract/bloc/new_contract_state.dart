part of 'new_contract_bloc.dart';

abstract class NewContractState extends Equatable {
  const NewContractState();

  @override
  List<Object> get props => [];
}

class NewContractLoading extends NewContractState {}

class NewContractLoaded extends NewContractState {
  final List<UserModel> usermodels;

  const NewContractLoaded({this.usermodels = const <UserModel>[]});

  @override
  List<Object> get props => [usermodels];
}
