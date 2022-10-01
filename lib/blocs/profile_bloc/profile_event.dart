part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileData extends ProfileEvent {
  final String symbol;

  FetchProfileData({required this.symbol});

  @override
  List<Object> get props => [symbol];
}

class SaveProfileData extends ProfileEvent {
  final String symbol;

  SaveProfileData({required this.symbol});

  @override
  List<Object> get props => [symbol];
}

class UnSaveProfileData extends ProfileEvent {
  final String symbol;

  UnSaveProfileData({required this.symbol});

  @override
  List<Object> get props => [symbol];
}
