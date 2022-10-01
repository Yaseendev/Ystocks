import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stocks_market/data/models/profile/profile.dart';
import 'package:stocks_market/data/respositories/profile_repository.dart';
import 'package:stocks_market/utils/locator.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final ProfileRepository profileRepo = locator.get<ProfileRepository>();
    on<ProfileEvent>((event, emit) async {
      if (event is FetchProfileData) {
        emit(ProfileLoading());
        await connectivity.checkConnectivity().then((connStatus) async {
          if (connStatus != ConnectivityResult.none) {
            try {
              emit(ProfileLoaded(
                profile: await profileRepo.fetchStockData(event.symbol),
              ));
            } catch (e) {
              emit(ProfileError(errMessage: 'There was an unkwon error'));
            }
          } else {
            emit(ProfileNoInternet());
          }
        });
      } else if (event is SaveProfileData) {
        await profileRepo.saveStockData(event.symbol);
      } else if (event is UnSaveProfileData) {
        await profileRepo.unsaveStockData(event.symbol);
      }
    });
  }
}
