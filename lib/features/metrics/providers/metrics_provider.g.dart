// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$metricsHash() => r'0ab9139b11929c218746d9f23163c0cf6319dbf6';

///Returns all
///
/// Copied from [metrics].
@ProviderFor(metrics)
final metricsProvider =
    AutoDisposeFutureProvider<List<MetricsViewmodel>>.internal(
  metrics,
  name: r'metricsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$metricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MetricsRef = AutoDisposeFutureProviderRef<List<MetricsViewmodel>>;
String _$getMetricsHash() => r'7b19de0d7c47c1b80bf8a51c1019c9f36cdd03c7';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
