part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class AllJobsState extends HomeState {}

class IncrementIndex extends HomeState {}

class DncrementIndex extends HomeState {}

class UpDataSearch extends HomeState {}

class SelectJobType extends HomeState {}

class SelectedLabel extends HomeState {}

class ShowCompanyState extends HomeState {}

class CountryCodeState extends HomeState {}

class StepperOfJobs extends HomeState {}

class JobNotificationState extends HomeState {}

class SaveItemState extends HomeState {}
