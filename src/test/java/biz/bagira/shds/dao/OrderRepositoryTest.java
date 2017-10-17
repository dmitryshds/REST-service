package biz.bagira.shds.dao;

import biz.bagira.shds.entities.Order;
import biz.bagira.shds.entities.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.EmbeddedDatabaseConnection;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashSet;
import java.util.Set;

import static org.assertj.core.api.Java6Assertions.assertThat;

@ActiveProfiles("test")
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(connection = EmbeddedDatabaseConnection.H2)
public class OrderRepositoryTest {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    UserRepository userRepository;
    @Test
    public void findAllByUserId() throws Exception {
        User newUser = new User();
               newUser.setUsername("Bob");

        Order order = new Order();
        order.setUser(newUser);
        Order order2 = new Order();
        order2.setUser(newUser);
        Set<Order> orders = new HashSet<>();
        orders.add(new Order());
        orders.add(new Order());
        newUser.setOrderList(orders);
        User save = userRepository.save(newUser);
        orderRepository.save(order);
        orderRepository.save(order2);
        Page<Order> allByUserId = orderRepository.findAllByUserId(save.getId(), null);
        assertThat(allByUserId.getContent().size())
                      .isEqualTo(2);

    }

}