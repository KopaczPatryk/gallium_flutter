part of 'hash_comparator_cubit.dart';

@freezed
class HashComparatorState with _$HashComparatorState {
  const factory HashComparatorState.initial() = _Initial;
  const factory HashComparatorState.beganComparison() = _BeganComparison;
  const factory HashComparatorState.comparisonProgress({
    required Matrix2<double?, HashAssociation, HashAssociation>
        comparisonMatrix,
  }) = _ComparisonProgress;
  const factory HashComparatorState.comparisonDone({
    required Matrix2<double?, HashAssociation, HashAssociation>
        comparisonMatrix,
  }) = _ComparisonDone;
}
