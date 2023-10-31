part of 'detail_bloc.dart';

abstract class DetailEvent {}

class ImageHoveEvent1 extends DetailEvent {
  bool isHover;
  String image;
  ImageHoveEvent1({required this.isHover, required this.image});
}

class ImageHoveEvent2 extends DetailEvent {
  bool isHover;
  String image;
  ImageHoveEvent2({required this.isHover, required this.image});
}

class ImageHoveEvent3 extends DetailEvent {
  bool isHover;
  String image;
  ImageHoveEvent3({required this.isHover, required this.image});
}

class ImageHoveEvent4 extends DetailEvent {
  bool isHover;
  String image;
  ImageHoveEvent4({required this.isHover, required this.image});
}


