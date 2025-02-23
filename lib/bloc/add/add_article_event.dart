part of 'add_article_bloc.dart';

sealed class AddArcticleEvent extends Equatable {
  const AddArcticleEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends AddArcticleEvent {
  final int imageOption; // 1: Cámara, 2: Galería
  final int typeButton;

  const PickImageEvent({required this.imageOption, required this.typeButton});
  @override
  List<Object> get props => [imageOption, typeButton];
}

class SubmitForm extends AddArcticleEvent {
  final String titleArticle;
  final String priceArticle;
  final String discountArticle;
  final String descriptionArticle;
  final Uint8List? imageBytes;
  final String? fileName;
  final List<Map<String, dynamic>> uploadedImages;

  const SubmitForm({
    required this.titleArticle,
    required this.priceArticle,
    required this.discountArticle,
    required this.descriptionArticle,
    required this.imageBytes,
    required this.fileName,
    required this.uploadedImages,
  });

  @override
  List<Object> get props => [
        titleArticle,
        priceArticle,
        discountArticle,
        imageBytes ?? Uint8List(0),
        fileName ?? '',
        uploadedImages,
      ];
}
