import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'progress_page_widget.dart' show ProgressPageWidget;
import 'package:flutter/material.dart';

class ProgressPageModel extends FlutterFlowModel<ProgressPageWidget> {
  ///  Local state fields for this page.

  DateTime? currentDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProgressPage widget.
  List<DayStatsRecord>? dailyStatsCollection;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
