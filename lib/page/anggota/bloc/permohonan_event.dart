part of 'permohonan_bloc.dart';

abstract class PermohonanEvent extends Equatable {
  const PermohonanEvent();
}

class GetPermohonanList extends PermohonanEvent {
  @override
  List<Object> get props => null;
}
