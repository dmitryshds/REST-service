package biz.bagira.shds.dao;

import biz.bagira.shds.entities.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends PagingAndSortingRepository<Order,Long> {

    Page<Order> findAllByUserId (@Param("user_id")Long user_id, Pageable pageable);

}
