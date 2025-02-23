import 'package:equatable/equatable.dart';

// part of 'add_article_bloc.dart';  // Esta debe ser la primera línea

import 'dart:typed_data';

abstract class AddArcticleState extends Equatable {
  const AddArcticleState();

  @override
  List<Object?> get props => [];
}

class FormInputState extends AddArcticleState {
  final String titleArticle;
  final String priceArticle;
  final String discountArticle;
  final String descriptionArticle;
  final Uint8List? imageBytes;
  final String? fileName;
  final List<Map<String, dynamic>> uploadedImages;
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  const FormInputState({
    required this.titleArticle,
    required this.priceArticle,
    required this.discountArticle,
    required this.descriptionArticle,
    this.imageBytes,
    this.fileName,
    this.uploadedImages = const [],
    this.isLoading = false,
    this.successMessage,
    this.errorMessage,
  });

  FormInputState copyWith({
    String? titleArticle,
    String? priceArticle,
    String? discountArticle,
    String? descriptionArticle,
    Uint8List? imageBytes,
    String? fileName,
    List<Map<String, dynamic>>? uploadedImages,
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
  }) {
    return FormInputState(
      titleArticle: titleArticle ?? this.titleArticle,
      priceArticle: priceArticle ?? this.priceArticle,
      discountArticle: discountArticle ?? this.discountArticle,
      descriptionArticle: descriptionArticle ?? this.descriptionArticle,
      imageBytes: imageBytes ?? this.imageBytes,
      fileName: fileName ?? this.fileName,
      uploadedImages: uploadedImages ?? this.uploadedImages,
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        titleArticle,
        priceArticle,
        discountArticle,
        descriptionArticle,
        imageBytes,
        fileName,
        uploadedImages,
        isLoading,
        successMessage,
        errorMessage,
      ];
}
