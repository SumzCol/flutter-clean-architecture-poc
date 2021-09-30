import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'barcode_scanner_event.dart';
part 'barcode_scanner_state.dart';
class BarcodeScannerBloc extends Bloc<BarcodeScannerEvent, BarcodeScannerState> {
  BarcodeScannerBloc() : super(BarcodeScannerInitial());
  @override
  Stream<BarcodeScannerState> mapEventToState(
    BarcodeScannerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
