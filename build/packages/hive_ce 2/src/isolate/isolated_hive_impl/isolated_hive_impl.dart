export 'impl/isolated_hive_impl_stub.dart'
    if (dart.library.io) 'impl/isolated_hive_impl_vm.dart'
    if (dart.library.js_interop) 'impl/isolated_hive_impl_web.dart';
