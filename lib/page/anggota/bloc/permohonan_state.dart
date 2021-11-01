part of 'permohonan_bloc.dart';

abstract class PermohonanState extends Equatable {
  const PermohonanState();

  @override
  List<Object> get props => [];
}

// class PermohonanInitial extends PermohonanState {}

class PermohonanInitial extends PermohonanState {
  const PermohonanInitial();
  @override
  List<Object> get props => [];
}

class PermohonanLoading extends PermohonanState {
  const PermohonanLoading();
  @override
  List<Object> get props => null;
}

class PermohonanLoaded extends PermohonanState {
  final Permohonan permohonanModel;
  const PermohonanLoaded(this.permohonanModel);
  @override
  List<Object> get props => [permohonanModel];
}

class PermohonanError extends PermohonanState {
  final String message;
  const PermohonanError(this.message);
  @override
  List<Object> get props => [message];
}
