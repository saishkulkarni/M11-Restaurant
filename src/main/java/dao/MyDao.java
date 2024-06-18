package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Customer;
import dto.FoodItem;
import dto.Hotel;

public class MyDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public void saveCustomer(Customer customer) {
		transaction.begin();
		manager.persist(customer);
		transaction.commit();
	}

	public void saveFoodItem(FoodItem foodItem) {
		transaction.begin();
		manager.persist(foodItem);
		transaction.commit();
	}

	public List<Hotel> findHotelByEmail(String email) {
		return manager.createQuery("select x from Hotel x where email=?1").setParameter(1, email).getResultList();
	}

	public void saveHotel(Hotel hotel) {
		transaction.begin();
		manager.persist(hotel);
		transaction.commit();
	}
}
