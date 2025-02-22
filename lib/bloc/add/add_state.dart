import 'package:equatable/equatable.dart';

class AddState extends Equatable {
  final String valueInput;
  final String typeInput;

  const AddState({this.valueInput = "", this.typeInput = ""});

  AddState copyWith({String? valueInput, String? typeInput}) {
    return AddState(
      valueInput: valueInput ?? this.valueInput,
      typeInput: typeInput ?? this.typeInput,
    );
  }

  @override
  List<Object> get props => [valueInput, typeInput];
}
