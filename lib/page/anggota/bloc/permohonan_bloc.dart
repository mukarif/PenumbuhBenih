import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petani/model/permohonan.dart';
import 'package:petani/util/api.dart';

part 'permohonan_event.dart';
part 'permohonan_state.dart';

class PermohonanBloc extends Bloc<PermohonanEvent, PermohonanState> {
  RestDatasource pmrepo = RestDatasource();

  PermohonanBloc() : super(const PermohonanInitial());

  @override
  Stream<PermohonanState> mapEventToState(PermohonanEvent event) async* {
    if (event is GetPermohonanList) {
      try {
        yield PermohonanLoading();
        final mList = await pmrepo.getPermohonanAnggota();
        // yield PermohonanLoaded(mList);
        // if (mList.error != null) {
        //   yield PermohonanError(mList.error);
        // }
      } catch (e) {
        yield PermohonanError("Failed to fetch data. is your device online?");
      }
      // on NetworkError {
      //   yield PermohonanError("Failed to fetch data. is your device online?");
      // }
    }
  }
}
