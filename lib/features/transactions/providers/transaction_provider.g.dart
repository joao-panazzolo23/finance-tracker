// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionProviderHash() =>
    r'f929bf994df5d5b103ce6eb23ced536e47f76107';

///returning a global instance of TRANSACTION PROVIDER (not the class)
///This is comparable to Singleton pattern
///Provider's name must match its partial class _$TransactionProvider
///
/// Copied from [TransactionProvider].
@ProviderFor(TransactionProvider)
final transactionProviderProvider =
    AutoDisposeAsyncNotifierProvider<
      TransactionProvider,
      List<TransactionModel>
    >.internal(
      TransactionProvider.new,
      name: r'transactionProviderProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$transactionProviderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TransactionProvider =
    AutoDisposeAsyncNotifier<List<TransactionModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
