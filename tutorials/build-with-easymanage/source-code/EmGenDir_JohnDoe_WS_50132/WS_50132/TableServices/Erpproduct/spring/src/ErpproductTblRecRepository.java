package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
/*QD import org.springframework.data.querydsl.QuerydslPredicateExecutor; QD*/ 
import emrest.spring.ErpproductTblRec; 
 
public interface ErpproductTblRecRepository extends JpaRepository<ErpproductTblRec, String> /*QD , QuerydslPredicateExecutor<ErpproductTblRec> QD*/ { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpproductTblRec> findAll(); 
	//List<ErpproductTblRec> findAll(Pageable pageable); 
 
	List<ErpproductTblRec> findByProductId(long productId); 
	//List<ErpproductTblRec> findByProductId(long productId, Pageable pageable); 
	//List<ErpproductTblRec> findByProductIdLike(long productId); 
	//List<ErpproductTblRec> findByProductIdContaining(long productId); 
	//List<ErpproductTblRec> findByProductIdAndProductId(long productId, long productId); 
	Long deleteByProductId(long productId); 
	//List<ErpproductTblRec> findByColumnName(String columnName); 
	//List<ErpproductTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
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
 
