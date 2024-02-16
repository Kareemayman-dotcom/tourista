import 'package:tourista/widgets/paragraph_widget.dart';

class PlaceModel {
  String shortVideoAddress;
  String fullVideoUrl;
  String title;
  List<ParagraphWidget> paragraphs;
  PlaceModel({
    required this.shortVideoAddress,
    required this.fullVideoUrl,
    required this.title,
    required this.paragraphs,
  });
}
