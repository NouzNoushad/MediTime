part of 'storage_cubit.dart';

sealed class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object> get props => [];
}

final class StorageInitial extends StorageState {}

final class StorageLoading extends StorageState {}

class StorageLoadedState extends StorageState {
  final List<Reminder> reminders;
  const StorageLoadedState(this.reminders);

  @override
  List<Object> get props => [reminders];
}

class AddToStorageState extends StorageState {
  final bool added;
  const AddToStorageState(this.added);

  @override
  List<Object> get props => [added];
}

class RemoveFromStorageState extends StorageState {
  final bool removed;
  const RemoveFromStorageState(this.removed);

  @override
  List<Object> get props => [removed];
}

class StorageErrorState extends StorageState {
  final String error;
  const StorageErrorState(this.error);

  @override
  List<Object> get props => [error];
}
