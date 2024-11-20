import 'package:crud/customer/infrastructure/models/customer_dto.dart';
import 'package:floor/floor.dart';

@dao
abstract class CustomerDao {
  @Query(
      'select * from customer where active="True" order by modifiedOn desc limit 1')
  Future<CustomerDto?> findLastItem();

  @Query('select * from customer where active="True"')
  Future<List<CustomerDto>> findAll();

  @Query('select * from customer')
  Stream<List<CustomerDto>> findAllStreaCustomer();

  @Query('select * from customer where customerID=:customerId')
  Future<CustomerDto?> findById(String customerId);

  // @Query('select * from customer where customerID=: customerId')
  // Stream<CustomerDto?> findByIdStream(String customerId);

  @Query('delete from customer where customerID=:customerId')
  Future<void> deleteById(String customerId);
  @delete
  Future<void> deleteAll(List<CustomerDto> itemGroup);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOne(CustomerDto itemGroup);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMany(List<CustomerDto> itemGroup);
}
