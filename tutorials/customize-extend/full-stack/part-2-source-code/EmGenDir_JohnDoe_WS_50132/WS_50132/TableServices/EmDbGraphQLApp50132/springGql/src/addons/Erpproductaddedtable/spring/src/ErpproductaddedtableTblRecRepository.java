package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
 import org.springframework.data.querydsl.QuerydslPredicateExecutor;  
import emrest.spring.ErpproductaddedtableTblRec; 
 
public interface ErpproductaddedtableTblRecRepository extends JpaRepository<ErpproductaddedtableTblRec, String>  , QuerydslPredicateExecutor<ErpproductaddedtableTblRec>  { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpproductaddedtableTblRec> findAll(); 
	//List<ErpproductaddedtableTblRec> findAll(Pageable pageable); 
 
	List<ErpproductaddedtableTblRec> findByProductId(long productId); 
	//List<ErpproductaddedtableTblRec> findByProductId(long productId, Pageable pageable); 
	//List<ErpproductaddedtableTblRec> findByProductIdLike(long productId); 
	//List<ErpproductaddedtableTblRec> findByProductIdContaining(long productId); 
	//List<ErpproductaddedtableTblRec> findByProductIdAndProductId(long productId, long productId); 
	Long deleteByProductId(long productId); 
	//List<ErpproductaddedtableTblRec> findByColumnName(String columnName); 
	//List<ErpproductaddedtableTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
	/* Examples on using @Query 
	1] 
	@Query("select s from Student s where s.age = ?") 
	List<Student> findStudentByAgeAndSorted(int age, Sort sort); 
	2] 
	@Query(value = "SELECT * FROM Student WHERE age = :age and name= :name", nativeQuery = true) 
	Book findStudentByAgeAndStudentNameNative1(@Param("age") int age, @Param("name") String name); 
	3] 
	@Query(value = "SELECT * FROM Student WHERE age = ? and name = ? ", nativeQuery = true) 
	Book findStudentByAgeAndNameNative2(String age, String studentName); 
	*/ 
 
 
} 
 
