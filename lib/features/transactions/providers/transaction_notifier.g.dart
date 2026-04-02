// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionNotifierHash() =>
    r'613430f1a1743570022d7551b54e46935afc3a0f';

///returning a global instance of TRANSACTION PROVIDER (not the class)
///This is comparable to Singleton pattern
///Provider's n
///
/// Copied from [TransactionNotifier].
@ProviderFor(TransactionNotifier)
final transactionNotifierProvider = AutoDisposeAsyncNotifierProvider<
    TransactionNotifier, List<TransactionModel>>.internal(
  TransactionNotifier.new,
  name: r'transactionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionNotifier
    = AutoDisposeAsyncNotifier<List<TransactionModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
