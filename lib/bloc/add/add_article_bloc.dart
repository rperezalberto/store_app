import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:store_app/bloc/add/add_article_state.dart';
import 'package:uuid/uuid.dart';

part 'add_article_event.dart';

class AddArcticleBloc extends Bloc<AddArcticleEvent, AddArcticleState> {
  final ImagePicker picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AddArcticleBloc()
      : super(const FormInputState(
            titleArticle: '',
            priceArticle: '',
            discountArticle: '',
            descriptionArticle: '')) {
    on<PickImageEvent>(_onPickImage);
    on<SubmitForm>(_onSubmitForm);
  }
// En el Bloc para el SubmitForm
  Future<void> _onSubmitForm(
      SubmitForm event, Emitter<AddArcticleState> emit) async {
    if (state is FormInputState) {
      final currentState = state as FormInputState;
      emit(currentState.copyWith(
        titleArticle: event.titleArticle,
        priceArticle: event.priceArticle,
        discountArticle: event.discountArticle,
        descriptionArticle: event.descriptionArticle,
        imageBytes: currentState.imageBytes,
        fileName: currentState.fileName,
        uploadedImages: currentState.uploadedImages,
      ));
      log("${event.titleArticle} ${currentState.uploadedImages}");
    }
  }

  Future<void> _onPickImage(
      PickImageEvent event, Emitter<AddArcticleState> emit) async {
    if (state is! FormInputState) return;

    final currentState = state as FormInputState;

    emit(currentState.copyWith(isLoading: true));

    try {
      XFile? pickedImage = await picker.pickImage(
        source:
            event.imageOption == 1 ? ImageSource.camera : ImageSource.gallery,
      );

      if (pickedImage == null) {
        emit(currentState.copyWith(isLoading: false));
        return;
      }

      final uuid = const Uuid().v6();
      final fileName = '$uuid.jpg';
      final dir = path.dirname(pickedImage.path);
      final newFilePath = path.join(dir, fileName);
      File newFile = await File(pickedImage.path).rename(newFilePath);
      Uint8List imageBytes = await newFile.readAsBytes();

      List<Map<String, dynamic>> updatedImages =
          List.from(currentState.uploadedImages);

      if (event.typeButton == 1) {
        emit(currentState.copyWith(
          imageBytes: imageBytes,
          fileName: fileName,
          isLoading: false,
        ));
      } else if (event.typeButton == 2) {
        if (updatedImages.length < 4) {
          updatedImages.add({'imageBytes': imageBytes, 'fileName': fileName});
        }
        emit(currentState.copyWith(
          uploadedImages: updatedImages,
          isLoading: false,
        ));
      }
    } catch (e) {
      log("Error al subir la imagen: $e");
      emit(currentState.copyWith(
        isLoading: false,
        errorMessage: "Error al subir la imagen",
      ));
    }
  }
}
