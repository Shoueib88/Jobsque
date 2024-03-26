part of 'homepage_cubit.dart';

@immutable
sealed class HomepageState {}

final class HomepageInitial extends HomepageState {}

class ChangeCurrentIndexState extends HomepageState {}

class GetToken extends HomepageState {}

class StoreToken extends HomepageState {}
