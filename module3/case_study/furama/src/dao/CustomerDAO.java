package dao;

import model.Customer;

import java.util.List;

public interface CustomerDAO {
    List<Customer> findAll();

    void save(Customer customer);

    void update(int id, Customer customer);

    void remove(int id);
}
