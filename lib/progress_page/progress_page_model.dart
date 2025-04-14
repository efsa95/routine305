import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'progress_page_widget.dart' show ProgressPageWidget;
import 'package:flutter/material.dart';

class ProgressPageModel extends FlutterFlowModel<ProgressPageWidget> {
  ///  Local state fields for this page.

  DateTime? currentDate;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
