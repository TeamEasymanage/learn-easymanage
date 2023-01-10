package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
 import org.springframework.data.querydsl.QuerydslPredicateExecutor;  
import emrest.spring.ErpinventorysumvwTblRec; 
 
public interface ErpinventorysumvwTblRecRepository extends JpaRepository<ErpinventorysumvwTblRec, String>  , QuerydslPredicateExecutor<ErpinventorysumvwTblRec>  { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpinventorysumvwTblRec> findAll(); 
	//List<ErpinventorysumvwTblRec> findAll(Pageable pageable); 
 
	List<ErpinventorysumvwTblRec> findByYear(long year); 
	//List<ErpinventorysumvwTblRec> findByYear(long year, Pageable pageable); 
	//List<ErpinventorysumvwTblRec> findByYearLike(long year); 
	//List<ErpinventorysumvwTblRec> findByYearContaining(long year); 
	//List<ErpinventorysumvwTblRec> findByYearAndYear(long year, long year); 
	Long deleteByYear(long year); 
	//List<ErpinventorysumvwTblRec> findByColumnName(String columnName); 
	//List<ErpinventorysumvwTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
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
 
