package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
 import org.springframework.data.querydsl.QuerydslPredicateExecutor;  
import emrest.spring.ErpcustomerTblRec; 
 
public interface ErpcustomerTblRecRepository extends JpaRepository<ErpcustomerTblRec, String>  , QuerydslPredicateExecutor<ErpcustomerTblRec>  { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpcustomerTblRec> findAll(); 
	//List<ErpcustomerTblRec> findAll(Pageable pageable); 
 
	List<ErpcustomerTblRec> findByCustomerId(String customerId); 
	//List<ErpcustomerTblRec> findByCustomerId(String customerId, Pageable pageable); 
	//List<ErpcustomerTblRec> findByCustomerIdLike(String customerId); 
	//List<ErpcustomerTblRec> findByCustomerIdContaining(String customerId); 
	//List<ErpcustomerTblRec> findByCustomerIdAndCustomerId(String customerId, String customerId); 
	Long deleteByCustomerId(String customerId); 
	//List<ErpcustomerTblRec> findByColumnName(String columnName); 
	//List<ErpcustomerTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
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
 
