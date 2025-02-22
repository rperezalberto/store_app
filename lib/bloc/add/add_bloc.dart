import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:store_app/bloc/add/add_state.dart';

part 'add_event.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final TextEditingController articleName = TextEditingController();
  final TextEditingController articleDescription = TextEditingController();

  AddBloc() : super(const AddState()) {
    on<ValidateInputEvent>(_onValidateInput);
  }

  void _onValidateInput(ValidateInputEvent event, Emitter<AddState> emit) {
    String trimmedValue = event.typeInput.trim();
    bool isValid = true;

    if (event.typeInput == "input") {
      isValid = trimmedValue.isNotEmpty && trimmedValue.length <= 50;
    } else if (event.typeInput == "textArea") {
      isValid = trimmedValue.isNotEmpty && trimmedValue.length <= 400;
    }

    // Emitimos un nuevo estado con el valor validado
    emit(state.copyWith(
        valueInput: event.valueInput, typeInput: event.typeInput));
  }
}
