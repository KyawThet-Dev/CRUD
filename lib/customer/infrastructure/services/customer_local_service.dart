import 'package:crud/customer/infrastructure/models/customer_dto.dart';
import 'package:crud/customer/infrastructure/services/dao/customer_dao.dart';

class CustomerLocalService {
  final CustomerDao _dao;

  CustomerLocalService(this._dao);

  Future<CustomerDto?> findLastCustomer() async {
    return await _dao.findLastItem();
  }

  Future<List<CustomerDto>> getAllCustomer() async {
    return await _dao.findAll();
  }

  Future<CustomerDto?> getCustomerById(String customerId) async {
    return await _dao.findById(customerId);
  }

  // Stream<CustomerDto?> getStreamCustomerById(String customerId) {
  //   return _dao.findByIdStream(customerId);
  // }

  Stream<List<CustomerDto>> getAllStreamCustomer() {
    return _dao.findAllStreaCustomer();
  }

  Future<void> addOne(CustomerDto customer) async {
    await _dao.insertOne(customer);
  }

  Future<void> addAll(List<CustomerDto> customers) async {
    await _dao.insertMany(customers);
  }

  Future<void> deleteById(String id) async {
    return _dao.deleteById(id);
  }

  Future<void> deleteAll(List<CustomerDto> customers) async {
    return _dao.deleteAll(customers);
  }
}
