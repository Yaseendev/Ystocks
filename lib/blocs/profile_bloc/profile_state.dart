part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileNoInternet extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileError extends ProfileState {
  final String errMessage;
  ProfileError({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

class ProfileLoaded extends ProfileState {
  final Profile? profile;
  //final bool isSymbolSaved;

  ProfileLoaded({
    required this.profile,
   // required this.isSymbolSaved,
  });
  @override
  List<Object?> get props => [profile];
}
