part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    List<Downloads>? downloads,
    required Option<Either<MainFailures,List<Downloads>>> downloadsFailureOrSuccess
  }) = _DownloadsState;

  factory DownloadsState.initail() {
    return const DownloadsState(isLoading: false,downloadsFailureOrSuccess: None());
  }
}
