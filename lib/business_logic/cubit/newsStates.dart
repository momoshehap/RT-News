abstract class NewsappStates {}

class InitNewsappState extends NewsappStates {}

class ChangeBottomNavBarstate extends NewsappStates {}

class NewsBusinessLoadingState extends NewsappStates {}

class GetBusinessDataSuccessState extends NewsappStates {}

class GetBusinessDataErorrState extends NewsappStates {
  final String error;
  GetBusinessDataErorrState(this.error);
}

class NewsSportsLoadingState extends NewsappStates {}

class GetSportsDataSuccessState extends NewsappStates {}

class GetSportsDataErorrState extends NewsappStates {
  final String error;
  GetSportsDataErorrState(this.error);
}

class NewsScienceLoadingState extends NewsappStates {}

class GetScienceDataSuccessState extends NewsappStates {}

class GetScienceDataErorrState extends NewsappStates {
  final String error;
  GetScienceDataErorrState(this.error);
}

class NewsSearchLoadingState extends NewsappStates {}

class GetSearcheDataSuccessState extends NewsappStates {}

class GetSearchDataErorrState extends NewsappStates {
  final String error;
  GetSearchDataErorrState(this.error);
}
