// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMetricsHash() => r'd89b6d64cf370e4afcb8201c65b2e924dea04fe5';

///Retrieve expenses and incomes for every month in the past year
///
/// Copied from [getMetrics].
@ProviderFor(getMetrics)
final getMetricsProvider =
    AutoDisposeFutureProvider<List<MetricsViewmodel>>.internal(
  getMetrics,
  name: r'getMetricsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMetricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMetricsRef = AutoDisposeFutureProviderRef<List<MetricsViewmodel>>;
String _$getResumedReviewHash() => r'5cd7123dc725d2e108e37f94fd913ceec93aaa5f';

/// See also [getResumedReview].
@ProviderFor(getResumedReview)
final getResumedReviewProvider = AutoDisposeProvider<FinanceResultDto>.internal(
  getResumedReview,
  name: r'getResumedReviewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getResumedReviewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetResumedReviewRef = AutoDisposeProviderRef<FinanceResultDto>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
