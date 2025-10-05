package group04.gundamshop.repository;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import group04.gundamshop.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    Category save(Category category);

    Category findById(long id);

    List<Category> findAllByStatus(boolean status);

    Category findByName(String name);
    
    @Query("SELECT c FROM Category c LEFT JOIN FETCH c.type WHERE c.name = :name")
    Category findByNameWithType(@Param("name") String name);
}
