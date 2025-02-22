part of 'add_bloc.dart';

sealed class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}

class ValidateInputEvent extends AddEvent {
  final String valueInput;
  final String typeInput;

  const ValidateInputEvent({required this.valueInput, required this.typeInput});
}
