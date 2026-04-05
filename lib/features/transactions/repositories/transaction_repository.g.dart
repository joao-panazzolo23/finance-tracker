// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionRepositoryHash() =>
    r'1e1415419772bb3df3a698e999e8545812ce65a6';

/// See also [transactionRepository].
@ProviderFor(transactionRepository)
final transactionRepositoryProvider =
    AutoDisposeProvider<TransactionRepository>.internal(
  transactionRepository,
  name: r'transactionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionRepositoryRef
    = AutoDisposeProviderRef<TransactionRepository>;
String _$transactionBoxHash() => r'a162497cf3943681c789b1c2c004ff83cf454f89';

///Returns an instance of transactions box.
///
/// Copied from [transactionBox].
@ProviderFor(transactionBox)
final transactionBoxProvider =
    AutoDisposeProvider<Box<TransactionModel>>.internal(
  transactionBox,
  name: r'transactionBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionBoxRef = AutoDisposeProviderRef<Box<TransactionModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
