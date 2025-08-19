import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/feature/admin/data/models/vendor_model.dart';
import 'package:e_commerce/feature/admin/data/source/admin_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: AdminDataSource)
class AdminImplDataSource implements AdminDataSource {
  @override
  Future<List<VendorModel>> getVendors() async {
    RealtimeChannel? realtimeChannel;

    try {
      final response = await Supabase.instance.client
          .from('users')
          .select('*')
          .eq('authorization', 'vendor').order('created_at', ascending: true);

      realtimeChannel = Supabase.instance.client
          .channel('vendors_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'users',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'authorization',
              value: 'vendor',
            ),
            callback: (payload) async {
              await Supabase.instance.client
                  .from('users')
                  .select('*')
                  .eq('authorization', 'vendor');
            },
          )
          .subscribe();

      return response.map((v) => VendorModel.fromSupabase(v)).toList();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException) {
        message = exception.message;
      } else if (exception is AuthException) {
        message = exception.message;
      } else if (exception is RemoteException) {
        message = exception.message;
      }
      throw RemoteException(message ?? "Failed to fetch vendors");
    }
  }

  @override
  Future<void> approveVendor(String vendorEmail) async {
    try {
      await Supabase.instance.client
          .from('users')
          .update({'status': 'approved'})
          .eq('email', vendorEmail);
      await getVendors();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException) {
        message = exception.message;
      } else if (exception is AuthException) {
        message = exception.message;
      } else if (exception is RemoteException) {
        message = exception.message;
      }
      throw RemoteException(message ?? "Failed to fetch vendors");
    }
  }

  @override
  Future<void> denyVendor(String vendorEmail) async {
    try {
      await Supabase.instance.client
          .from('users')
          .update({'status': 'denied'})
          .eq('email', vendorEmail);
      await getVendors();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException) {
        message = exception.message;
      } else if (exception is AuthException) {
        message = exception.message;
      } else if (exception is RemoteException) {
        message = exception.message;
      }
      throw RemoteException(message ?? "Failed to deny vendor");
    }
  }
}
