package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
 import org.springframework.data.querydsl.QuerydslPredicateExecutor;  
import emrest.spring.ErpinventoryvwTblRec; 
 
public interface ErpinventoryvwTblRecRepository extends JpaRepository<ErpinventoryvwTblRec, String>  , QuerydslPredicateExecutor<ErpinventoryvwTblRec>  { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpinventoryvwTblRec> findAll(); 
	//List<ErpinventoryvwTblRec> findAll(Pageable pageable); 
 
	List<ErpinventoryvwTblRec> findByInvId(long invId); 
	//List<ErpinventoryvwTblRec> findByInvId(long invId, Pageable pageable); 
	//List<ErpinventoryvwTblRec> findByInvIdLike(long invId); 
	//List<ErpinventoryvwTblRec> findByInvIdContaining(long invId); 
	//List<ErpinventoryvwTblRec> findByInvIdAndInvId(long invId, long invId); 
	Long deleteByInvId(long invId); 
	//List<ErpinventoryvwTblRec> findByColumnName(String columnName); 
	//List<ErpinventoryvwTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
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
 
