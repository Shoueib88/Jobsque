part of 'saved_cubit.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

class ApplyJob extends SavedState {}

class IsLoading extends SavedState {
  IsLoading({required this.isload});
  final bool isload;
}

class UploadFileState extends SavedState {}

class UploadOtherFileState extends SavedState {}

class AddFileIntoList extends SavedState {}
