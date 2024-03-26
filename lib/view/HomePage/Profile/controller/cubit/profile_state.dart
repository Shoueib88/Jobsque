part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class SwitchValueState extends ProfileState {}

class SwitchEyeIconState extends ProfileState {}

class SetTwoStepVerificationTypeState extends ProfileState {}

class PersonalDetailsModelState extends ProfileState {}

class EducationModelState extends ProfileState {}

class ExperienceModelState extends ProfileState {}

class ProtfolioModelState extends ProfileState {}

class EditProfileState extends ProfileState {}

class IsLoading extends ProfileState {
  IsLoading({required this.isload});
  final bool isload;
}

class UploadCvFile extends ProfileState {}

class PickImageState extends ProfileState {}

class AddProfileState extends ProfileState {}

class DataOfProfile extends ProfileState {}

class ExperienceState extends ProfileState {}
